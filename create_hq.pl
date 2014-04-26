sco_to_hsql(SCO,HSQL):-
	retractall(select_(_)),
	retractall(from_(_)),
	retractall(where_(_)),
	doSCO_To_HSQL(SCO),
	select_(SELECT_LIST),                              sort(SELECT_LIST), print_select_list(SELECT_LIST,HSQL_1),
	findall(DS_as_Alias,from_(DS_as_Alias),FROM_LIST), sort(FROM_LIST),   print_from_list(FROM_LIST,HSQL_2),
	findall(Exp,where_(Exp),WHERE_LIST),               sort(WHERE_LIST),  print_where_list(WHERE_LIST,HSQL_3),
	concat_all_atoms(['SELECT ', HSQL_1,' FROM ',HSQL_2, ' WHERE ', HSQL_3],HSQL).

print_select_list([],''):-!.
print_select_list([Exp],Item):-!,print_att(Exp,Item).
print_select_list([Exp|Head],HSQL):- Head\=[],!, print_select_list(Head, HSQL_2),
						 print_att(Exp,Item),
					         concat_all_atoms([Item, ', ',HSQL_2],HSQL).

print_att(Method::Att,HSQL):-concat_all_atoms([Method,'.',Att],HSQL).

print_from_list([],''):-!.
print_from_list([_::Op as Alias], HSQL):-!, concat_all_atoms([Op,' as ',Alias], HSQL).
print_from_list([_::Op as Alias|Head], HSQL):- Head\=[],!, print_from_list(Head,HSQL_2),
						           concat_all_atoms([Op,' as ',Alias,', ',HSQL_2], HSQL).

print_where_list([],''):-!.
print_where_list([Exp],HSQL):-   Exp=..[Comp|[Left,Right]], Right\=_::_,!, %retrieval expression
				 print_att(Left,  LeftAtt),
			         concat_all_atoms([LeftAtt,Comp,'\'',Right,'\''],HSQL).
print_where_list([Exp], HSQL):-  Exp=..[Comp|[Left,Right]],!,
				     print_att(Left,  LeftAtt),
				     print_att(Right, RightAtt),
			             concat_all_atoms([LeftAtt,Comp,RightAtt], HSQL).
	
print_where_list([Exp|Head], HSQL):- Head\=[],Exp=..[Comp|[Left,Right]], Right\=_::_,!, %retrieval expression
			             print_where_list(Head,HSQL_2),
				     print_att(Left,LeftAtt),
			             concat_all_atoms([LeftAtt,Comp,'\'',Right,'\'',' AND ',HSQL_2],HSQL).
print_where_list([Exp|Head], HSQL):- Head\=[],!, Exp=..[Comp|[Left,Right]],
			             print_where_list(Head,HSQL_2),
				     print_att(Left,  LeftAtt),
				     print_att(Right, RightAtt),
			             concat_all_atoms([LeftAtt,Comp,RightAtt,' AND ',HSQL_2], HSQL).

doSCO_To_HSQL(SCO):-
	SCO=..[rho|[DS as Alias, DS]],!,
	assertz(from_(DS as Alias)).

doSCO_To_HSQL(SCO):-
	SCO=..[sigma|[Exp, Operand]],!,
	assertz(where_(Exp)),
	doSCO_To_HSQL(Operand).

doSCO_To_HSQL(SCO):-
	SCO=..[pi|[List, Operand]],!,
	assertz(select_(List)),
	doSCO_To_HSQL(Operand).


doSCO_To_HSQL(SCO):-
	SCO=..[Operator|[[Exp], OperandLeft,OperandRight]],
	(Operator=corr;
         Operator=bind),!,
	assertz(where_(Exp)),
	doSCO_To_HSQL(OperandLeft),
	doSCO_To_HSQL(OperandRight).


print_dtfs([]):-!.
print_dtfs([DTF|Tail]):-
        DTF=..[ID|[A,F,P,ID]],
        nl,write(ID),write('('),write(A),write(', '),
        nl,write('     '),write(F),write(', '),
        nl,write('     '),write(P),write('.'),
        print_dtfs(Tail).

create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings,NumberOfBlockingProjections,NumberOfProjections,_):-
        ToCompare is 1 +(NumberOfJoins+NumberOfBindings),
	(
        NumberOfDS\= ToCompare, !
        %,nl,write('Error in the number of correlations w.r.t. the number of DSs')
	);
	(
	NumberOfDS<NumberOfFilterings,!
        %,nl,write('Error in the number of filterings w.r.t. the number of DSs')
	);
        (
	ToCompare is NumberOfProjections+NumberOfBlockingProjections,
        NumberOfDS<ToCompare,!
        %,nl,write('Error in the number of projections w.r.t. the number of DSs')
        ),!.

create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS):-
        NumberOfRetrievals is NumberOfDS-NumberOfBindings,
        retractall(queried_ds(_)),
	retractall(type_name(_,_)),
        retractall(bounded_att(_,_)),
        retractall(filtered_att(_,_)),
        retractall(correlated_att(_,_)),
        retractall(correlated_dss(_,_)),
        retractall(projected_att(_,_)),
        gen_rexp(NumberOfRetrievals,REXPS),
        gen_bexp(NumberOfBindings,BEXPS),
        gen_cexp(NumberOfJoins,CEXPS),
        (   NumberOfDS=:=1;
            (findall([Inner,Outer],clause(correlated_dss(Inner,Outer),true),Correlated),
             unionAll(Correlated,Union),
             length(Union,NumberOfCorrelatedDSs),
             %nl, write('NumberOfCorrelatedDSs:'),write(NumberOfCorrelatedDSs),
             NumberOfCorrelatedDSs=:=NumberOfDS
            )
        ),
        gen_fexp(NumberOfFilterings,FEXPS),
        gen_proj(NumberOfProjections,PROJ_EXPS),
        gen_blocking_proj(NumberOfBlockingProjetions,BPROJ_EXPS),
        unionAll([REXPS,BEXPS,CEXPS,FEXPS,PROJ_EXPS,BPROJ_EXPS],DTFS),!.

create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS):-
        NumberOfRetrievals is NumberOfDS-NumberOfBindings,
        retractall(queried_ds(_)),
        retractall(type_name(_,_)),
        retractall(bounded_att(_,_)),
        retractall(filtered_att(_,_)),
        retractall(correlated_att(_,_)),
        retractall(correlated_dss(_,_)),
        retractall(projected_att(_,_)),
        gen_rexp(NumberOfRetrievals,REXPS),
        gen_bexp(NumberOfBindings,BEXPS),
        gen_cexp(NumberOfJoins,CEXPS),
        (   NumberOfDS=:=1;
            (findall([Inner,Outer],clause(correlated_dss(Inner,Outer),true),Correlated),
             unionAll(Correlated,Union),
             length(Union,NumberOfCorrelatedDSs),
             %nl, write('NumberOfCorrelatedDSs:'),write(NumberOfCorrelatedDSs),
             NumberOfCorrelatedDSs=:=NumberOfDS
            )
        ),
        gen_fexp(NumberOfFilterings,FEXPS),
        gen_proj(NumberOfProjections,PROJ_EXPS),
        gen_blocking_proj(NumberOfBlockingProjetions,BPROJ_EXPS),
        unionAll([REXPS,BEXPS,CEXPS,FEXPS,PROJ_EXPS,BPROJ_EXPS],DTFS),!.

create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS):-
        NumberOfRetrievals is NumberOfDS-NumberOfBindings,
        retractall(queried_ds(_)),
        retractall(type_name(_,_)),
        retractall(bounded_att(_,_)),
        retractall(filtered_att(_,_)),
        retractall(correlated_att(_,_)),
        retractall(correlated_dss(_,_)),
        retractall(projected_att(_,_)),
        gen_rexp(NumberOfRetrievals,REXPS),
        gen_bexp(NumberOfBindings,BEXPS),
        gen_cexp(NumberOfJoins,CEXPS),
        (   NumberOfDS=:=1;
            (findall([Inner,Outer],clause(correlated_dss(Inner,Outer),true),Correlated),
             unionAll(Correlated,Union),
             length(Union,NumberOfCorrelatedDSs),
             %nl, write('NumberOfCorrelatedDSs:'),write(NumberOfCorrelatedDSs),
             NumberOfCorrelatedDSs=:=NumberOfDS
            )
        ),
        gen_fexp(NumberOfFilterings,FEXPS),
        gen_proj(NumberOfProjections,PROJ_EXPS),
        gen_blocking_proj(NumberOfBlockingProjetions,BPROJ_EXPS),
        unionAll([REXPS,BEXPS,CEXPS,FEXPS,PROJ_EXPS,BPROJ_EXPS],DTFS),!.

create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS):-
        NumberOfRetrievals is NumberOfDS-NumberOfBindings,
        retractall(queried_ds(_)),
        retractall(type_name(_,_)),
        retractall(bounded_att(_,_)),
        retractall(filtered_att(_,_)),
        retractall(correlated_att(_,_)),
        retractall(correlated_dss(_,_)),
        retractall(projected_att(_,_)),
        gen_rexp(NumberOfRetrievals,REXPS),
        gen_bexp(NumberOfBindings,BEXPS),
        gen_cexp(NumberOfJoins,CEXPS),
        (   NumberOfDS=:=1;
            (findall([Inner,Outer],clause(correlated_dss(Inner,Outer),true),Correlated),
             unionAll(Correlated,Union),
             length(Union,NumberOfCorrelatedDSs),
             %nl, write('NumberOfCorrelatedDSs:'),write(NumberOfCorrelatedDSs),
             NumberOfCorrelatedDSs=:=NumberOfDS
            )
        ),
        gen_fexp(NumberOfFilterings,FEXPS),
        gen_proj(NumberOfProjections,PROJ_EXPS),
        gen_blocking_proj(NumberOfBlockingProjetions,BPROJ_EXPS),
        unionAll([REXPS,BEXPS,CEXPS,FEXPS,PROJ_EXPS,BPROJ_EXPS],DTFS),!.

create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS):-
        NumberOfRetrievals is NumberOfDS-NumberOfBindings,
        retractall(queried_ds(_)),
        retractall(type_name(_,_)),
        retractall(bounded_att(_,_)),
        retractall(filtered_att(_,_)),
        retractall(correlated_att(_,_)),
        retractall(correlated_dss(_,_)),
        retractall(projected_att(_,_)),
        gen_rexp(NumberOfRetrievals,REXPS),
        gen_bexp(NumberOfBindings,BEXPS),
        gen_cexp(NumberOfJoins,CEXPS),
        (   NumberOfDS=:=1;
            (findall([Inner,Outer],clause(correlated_dss(Inner,Outer),true),Correlated),
             unionAll(Correlated,Union),
             length(Union,NumberOfCorrelatedDSs),
             %nl, write('NumberOfCorrelatedDSs:'),write(NumberOfCorrelatedDSs),
             NumberOfCorrelatedDSs=:=NumberOfDS
            )
        ),
        gen_fexp(NumberOfFilterings,FEXPS),
        gen_proj(NumberOfProjections,PROJ_EXPS),
        gen_blocking_proj(NumberOfBlockingProjetions,BPROJ_EXPS),
        unionAll([REXPS,BEXPS,CEXPS,FEXPS,PROJ_EXPS,BPROJ_EXPS],DTFS),!.

create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS):-
        NumberOfRetrievals is NumberOfDS-NumberOfBindings,
        retractall(queried_ds(_)),
        retractall(type_name(_,_)),
        retractall(bounded_att(_,_)),
        retractall(filtered_att(_,_)),
        retractall(correlated_att(_,_)),
        retractall(correlated_dss(_,_)),
        retractall(projected_att(_,_)),
        gen_rexp(NumberOfRetrievals,REXPS),
        gen_bexp(NumberOfBindings,BEXPS),
        gen_cexp(NumberOfJoins,CEXPS),
        (   NumberOfDS=:=1;
            (findall([Inner,Outer],clause(correlated_dss(Inner,Outer),true),Correlated),
             unionAll(Correlated,Union),
             length(Union,NumberOfCorrelatedDSs),
             %nl, write('NumberOfCorrelatedDSs:'),write(NumberOfCorrelatedDSs),
             NumberOfCorrelatedDSs=:=NumberOfDS
            )
        ),
        gen_fexp(NumberOfFilterings,FEXPS),
        gen_proj(NumberOfProjections,PROJ_EXPS),
        gen_blocking_proj(NumberOfBlockingProjetions,BPROJ_EXPS),
        unionAll([REXPS,BEXPS,CEXPS,FEXPS,PROJ_EXPS,BPROJ_EXPS],DTFS),!.

create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS):-
        NumberOfRetrievals is NumberOfDS-NumberOfBindings,
        retractall(queried_ds(_)),
        retractall(type_name(_,_)),
        retractall(bounded_att(_,_)),
        retractall(filtered_att(_,_)),
        retractall(correlated_att(_,_)),
        retractall(correlated_dss(_,_)),
        retractall(projected_att(_,_)),
        gen_rexp(NumberOfRetrievals,REXPS),
        gen_bexp(NumberOfBindings,BEXPS),
        gen_cexp(NumberOfJoins,CEXPS),
        (   NumberOfDS=:=1;
            (findall([Inner,Outer],clause(correlated_dss(Inner,Outer),true),Correlated),
             unionAll(Correlated,Union),
             length(Union,NumberOfCorrelatedDSs),
             %nl, write('NumberOfCorrelatedDSs:'),write(NumberOfCorrelatedDSs),
             NumberOfCorrelatedDSs=:=NumberOfDS
            )
        ),
        gen_fexp(NumberOfFilterings,FEXPS),
        gen_proj(NumberOfProjections,PROJ_EXPS),
        gen_blocking_proj(NumberOfBlockingProjetions,BPROJ_EXPS),
        unionAll([REXPS,BEXPS,CEXPS,FEXPS,PROJ_EXPS,BPROJ_EXPS],DTFS),!.

create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS):-
        NumberOfRetrievals is NumberOfDS-NumberOfBindings,
        retractall(queried_ds(_)),
        retractall(type_name(_,_)),
        retractall(bounded_att(_,_)),
        retractall(filtered_att(_,_)),
        retractall(correlated_att(_,_)),
        retractall(correlated_dss(_,_)),
        retractall(projected_att(_,_)),
        gen_rexp(NumberOfRetrievals,REXPS),
        gen_bexp(NumberOfBindings,BEXPS),
        gen_cexp(NumberOfJoins,CEXPS),
        (   NumberOfDS=:=1;
            (findall([Inner,Outer],clause(correlated_dss(Inner,Outer),true),Correlated),
             unionAll(Correlated,Union),
             length(Union,NumberOfCorrelatedDSs),
             %nl, write('NumberOfCorrelatedDSs:'),write(NumberOfCorrelatedDSs),
             NumberOfCorrelatedDSs=:=NumberOfDS
            )
        ),
        gen_fexp(NumberOfFilterings,FEXPS),
        gen_proj(NumberOfProjections,PROJ_EXPS),
        gen_blocking_proj(NumberOfBlockingProjetions,BPROJ_EXPS),
        unionAll([REXPS,BEXPS,CEXPS,FEXPS,PROJ_EXPS,BPROJ_EXPS],DTFS),!.

create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS):-
        NumberOfRetrievals is NumberOfDS-NumberOfBindings,
        retractall(queried_ds(_)),
        retractall(type_name(_,_)),
        retractall(bounded_att(_,_)),
        retractall(filtered_att(_,_)),
        retractall(correlated_att(_,_)),
        retractall(correlated_dss(_,_)),
        retractall(projected_att(_,_)),
        gen_rexp(NumberOfRetrievals,REXPS),
        gen_bexp(NumberOfBindings,BEXPS),
        gen_cexp(NumberOfJoins,CEXPS),
        (   NumberOfDS=:=1;
            (findall([Inner,Outer],clause(correlated_dss(Inner,Outer),true),Correlated),
             unionAll(Correlated,Union),
             length(Union,NumberOfCorrelatedDSs),
             %nl, write('NumberOfCorrelatedDSs:'),write(NumberOfCorrelatedDSs),
             NumberOfCorrelatedDSs=:=NumberOfDS
            )
        ),
        gen_fexp(NumberOfFilterings,FEXPS),
        gen_proj(NumberOfProjections,PROJ_EXPS),
        gen_blocking_proj(NumberOfBlockingProjetions,BPROJ_EXPS),
        unionAll([REXPS,BEXPS,CEXPS,FEXPS,PROJ_EXPS,BPROJ_EXPS],DTFS),!.

create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS):-
        NumberOfRetrievals is NumberOfDS-NumberOfBindings,
        retractall(queried_ds(_)),
        retractall(type_name(_,_)),
        retractall(bounded_att(_,_)),
        retractall(filtered_att(_,_)),
        retractall(correlated_att(_,_)),
        retractall(correlated_dss(_,_)),
        retractall(projected_att(_,_)),
        gen_rexp(NumberOfRetrievals,REXPS),
        gen_bexp(NumberOfBindings,BEXPS),
        gen_cexp(NumberOfJoins,CEXPS),
        (   NumberOfDS=:=1;
            (findall([Inner,Outer],clause(correlated_dss(Inner,Outer),true),Correlated),
             unionAll(Correlated,Union),
             length(Union,NumberOfCorrelatedDSs),
             %nl, write('NumberOfCorrelatedDSs:'),write(NumberOfCorrelatedDSs),
             NumberOfCorrelatedDSs=:=NumberOfDS
            )
        ),
        gen_fexp(NumberOfFilterings,FEXPS),
        gen_proj(NumberOfProjections,PROJ_EXPS),
        gen_blocking_proj(NumberOfBlockingProjetions,BPROJ_EXPS),
        unionAll([REXPS,BEXPS,CEXPS,FEXPS,PROJ_EXPS,BPROJ_EXPS],DTFS),!.


