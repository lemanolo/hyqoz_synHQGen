gen_rexp(N, REXPS):-	
	do_gen_rexp(N,REXPS).

do_gen_rexp(0, []):-!.
do_gen_rexp(N, [R_DTF|REXPS_Tail]):-
	findall(DS,(api(DS,_,_,_), \+clause(queried_ds(DS),true)), AvailableDS),
	random_memberchk(NextDS,AvailableDS),
	NextDS=Sname::Operation,
	api(NextDS,Input,Output,_),

	ID=retr,
	%concat_all_atoms([Sname,'_',Operation],Alias), %Original
	concat_all_atoms([Operation],Alias),  %Experiments
	findall((Alias::InputAtt = ConstantValue),(member(InputAtt,Input),
			                           concat_all_atoms([val,'_r_',InputAtt],ConstantValue)
			                          ), RetrievalExpressions),
	findall(Alias::Att,(member(Att,Input);member(Att, Output)),Projection),
	sort(Projection),
	R_DTF=..[ID|[[Alias],RetrievalExpressions,Projection,ID]],
	assertz(queried_ds(NextDS)),
	findall(_,(member(Att,Input), assertz(bounded_att(NextDS, Att))),_),
	assertz(type_name(Alias,NextDS)),
	N2 is N-1,
	do_gen_rexp(N2,REXPS_Tail),!.
