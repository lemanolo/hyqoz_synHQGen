gen_proj(N, PROJ_EXPS):-	
	do_gen_proj(N,PROJ_EXPS).

do_gen_proj(0, []):-!.
do_gen_proj(N, [PROJ_DTF|PROJ_EXPS_Tail]):-
	findall(DS,(api(DS,_,_,_), clause(queried_ds(DS),true),\+clause(projected_att(DS,_),true)), AvailableDS),
	sort(AvailableDS),
	random_memberchk(DSToProject,AvailableDS),
	api(DSToProject,Input,Output,_),

	ID=proj,
	type_name(Alias,DSToProject),
	unionAll([Input,Output], AllAtts),
	findall(Alias::Att,random_member(Att,AllAtts), RandomProjection),

	findall(Alias::Att,(clause(filtered_att(DSToProject,Att),true);
                            clause(correlated_att(DSToProject,Att),true);
			    clause(bounded_att(DSToProject,Att),true))
                          ,UsedAtts),

	union(RandomProjection,UsedAtts,Projection),
	sort(Projection),
	PROJ_DTF=..[ID|[[Alias],[],Projection,ID]],
	findall(_,( member(Att,Projection),assertz(projected_att(DSToProject,Att))),_),
	N2 is N-1,
	do_gen_proj(N2,PROJ_EXPS_Tail),!.

gen_blocking_proj(N, PROJ_EXPS):-
        do_gen_blocking_proj(N,PROJ_EXPS).

do_gen_blocking_proj(0, []):-!.
do_gen_blocking_proj(N, [PROJ_DTF|PROJ_EXPS_Tail]):-
        findall(DS,(api(DS,_,_,_), clause(queried_ds(DS),true),\+clause(projected_att(DS,_),true)), AvailableDS),
        sort(AvailableDS),
        random_memberchk(DSToProject,AvailableDS),
        api(DSToProject,Input,Output,_),

        ID=proj,
        type_name(Alias,DSToProject),
        unionAll([Input,Output], AllAtts),
        findall(Alias::Att,random_member(Att,AllAtts), RandomProjection),
	findall(Alias::Att, clause(bounded_att(DSToProject,Att),true) ,BounedAtts),
	findall(Alias::Att, clause(filtered_att(DSToProject,Att),true) ,FilteredAtts),
	findall(Alias::Att, clause(correlated_att(DSToProject,Att),true) ,CorrelatedAtts),
	unionAll([RandomProjection,BounedAtts,FilteredAtts,CorrelatedAtts], PreProjection),

	union(FilteredAtts,CorrelatedAtts,CandidatesToDrop),
	findall(Att,random_member(Att,CandidatesToDrop),AttsToDrop),
        difference(PreProjection,AttsToDrop,Projection),
        sort(Projection),
        PROJ_DTF=..[ID|[[Alias],[],Projection,ID]],
        findall(_,( member(Att,Projection),assertz(projected_att(DSToProject,Att))),_),
        N2 is N-1,
        do_gen_blocking_proj(N2,PROJ_EXPS_Tail),!.
