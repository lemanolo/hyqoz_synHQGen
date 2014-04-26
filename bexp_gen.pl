gen_bexp(N, BEXPS):-
	do_gen_bexp(N,BEXPS).

do_gen_bexp(0,[]):-!.
do_gen_bexp(N,[B_DTF|BEXPS_Tail]):-
        findall(DS,(api(DS,_,_,_), \+clause(queried_ds(DS),true)), AvailableDS),
	%sort(AvailableDS),
        random_memberchk(DSToBind,AvailableDS),
        DSToBind=SNameToBind::OperationToBind,
        api(DSToBind,InputToBind,OutputToBind,_),
	length(InputToBind,LengthToBind),

	findall(DS,(queried_ds(DS),api(DS,_,O,_),length(O,LO), LO>=LengthToBind), DSsForBinding),
	random_memberchk(DSForBinding, DSsForBinding),
	api(DSForBinding,InputForBinding,OutputForBinding,_),
	type_name(DSForBindingAlias,DSForBinding),
	findall(SubList,(findall(Att,member(Att, OutputForBinding),Atts),
		      sort(Atts),
		      sublist(SubList,Atts),
		      length(SubList,LengthToBind),!),
		[AttsForBinding]),

        ID=bind,
        %concat_all_atoms([SNameToBind,'_',OperationToBind],DSToBindAlias), %Original
        concat_all_atoms([OperationToBind],DSToBindAlias), %Experiments
        findall(DSToBindAlias::Att,     (member(Att,InputToBind);     member(Att, OutputToBind)),     ToBindProjection),
        findall(DSForBindingAlias::Att, (member(Att,InputForBinding); member(Att, OutputForBinding)), ForBindingProjection),
        unionAll([ToBindProjection,ForBindingProjection],Projection),
        sort(Projection),

	findall((DSToBindAlias::AttToBind = DSForBindingAlias::AttForBinding),(nth(Idx,InputToBind,AttToBind),nth(Idx,AttsForBinding,AttForBinding)),BEXP),
        B_DTF=..[ID|[[DSToBindAlias,DSForBindingAlias], BEXP,Projection,ID]],
        assertz(queried_ds(DSToBind)),
        assertz(correlated_dss(DSToBind,DSForBinding)),
	findall(_,(member(Att,InputToBind),    assertz(correlated_att(DSToBind, Att))),    _),
	findall(_,(member(Att,AttsForBinding), assertz(correlated_att(DSForBinding, Att))),_),
        assertz(type_name(DSToBindAlias,DSToBind)),
        N2 is N-1,
        do_gen_bexp(N2,BEXPS_Tail),!.
