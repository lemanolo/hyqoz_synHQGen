gen_cexp(N, CEXPS):-
	do_gen_cexp(N, CEXPS).

do_gen_cexp(0, []):-!.
do_gen_cexp(N, [C_DTF|CEXPS_Tail]):-
	findall(DS,queried_ds(DS), DSToCorrelate),
	sort(DSToCorrelate),
	findall([InnerDS,OuterDS],( random_member(InnerDS,DSToCorrelate),
				    random_member(OuterDS,DSToCorrelate),
				    InnerDS\=OuterDS,
				    \+clause(correlated_dss(InnerDS,OuterDS),true),
				    \+clause(correlated_dss(OuterDS,InnerDS),true),
				    %The operands InnerDS and OuterDS do not prticipate into another correlation with a common operand CommonDS
				    findall(CommonDS,(  (clause(correlated_dss(CommonDS,InnerDS),true),clause(correlated_dss(CommonDS,OuterDS),true));
							(clause(correlated_dss(InnerDS,CommonDS),true),clause(correlated_dss(CommonDS,OuterDS),true));
							(clause(correlated_dss(CommonDS,InnerDS),true),clause(correlated_dss(OuterDS,CommonDS),true));
							(clause(correlated_dss(InnerDS,CommonDS),true),clause(correlated_dss(OuterDS,CommonDS),true))
						     ),[]),!
				  ),
		[[InnerDS,OuterDS]]),

	api(InnerDS,InnerInput,InnerOutput,_),
	type_name(InnerAlias,InnerDS),
	findall(FreeInnerAtt,(member(FreeInnerAtt,InnerOutput), (( clause(correlated_att(_,_),true), \+correlated_att(InnerDS,FreeInnerAtt));
                                                                (\+clause(correlated_att(_),true)))
                          ),
                FreeInputAtts),
        random_memberchk(InnerAtt,FreeInputAtts),

	api(OuterDS,OuterInput,OuterOutput,_),
	type_name(OuterAlias,OuterDS),
	findall(FreeOuterAtt,(member(FreeOuterAtt,OuterOutput), (( clause(correlated_att(_,_),true), \+correlated_att(OuterDS,FreeOuterAtt));
                                                                (\+clause(correlated_att(_),true)))
                          ),
                FreeOuterAtts),
        random_memberchk(OuterAtt,FreeOuterAtts),
	ID=corr,
	findall(InnerAlias::Att,(member(Att,InnerInput);member(Att, InnerOutput)),InnerProjection),
	findall(OuterAlias::Att,(member(Att,OuterInput);member(Att, OuterOutput)),OuterProjection),
	unionAll([InnerProjection,OuterProjection],Projection),
	sort(Projection),
	C_DTF=..[ID|[[InnerAlias,OuterAlias],[(InnerAlias::InnerAtt = OuterAlias::OuterAtt)],Projection,ID]],
	assertz(correlated_dss(InnerDS,OuterDS)),
	assertz(correlated_att(InnerDS,InnerAtt)),
	assertz(correlated_att(OuterDS,OuterAtt)),
	N2 is N-1,
        do_gen_cexp(N2,CEXPS_Tail),!.
