gen_fexp(N, REXPS):-	
	do_gen_fexp(N,REXPS).

do_gen_fexp(0, []):-!.
do_gen_fexp(N, [F_DTF|REXPS_Tail]):-
	findall(DS,(api(DS,_,_,_), clause(queried_ds(DS),true),\+clause(filtered_att(DS,_),true)), AvailableDS),
	sort(AvailableDS),
	random_memberchk(DSToFilter,AvailableDS),
	api(DSToFilter,Input,Output,_),
	findall(OutputAtt,(member(OutputAtt,Output), \+clause(filtered_att(DSToFilter,OutputAtt),true)), OutputAtts),
	random_memberchk(AttToFilter,OutputAtts),

	ID=filt,
	type_name(Alias,DSToFilter),
	concat_all_atoms([val,'_f_',AttToFilter],ConstantValue),
	findall(Alias::Att,(member(Att,Input);member(Att, Output)),Projection),
	sort(Projection),
	F_DTF=..[ID|[[Alias],[(Alias::AttToFilter = ConstantValue)],Projection,ID]],
	assertz(filtered_att(DSToFilter,AttToFilter)),
	N2 is N-1,
	do_gen_fexp(N2,REXPS_Tail),!.
