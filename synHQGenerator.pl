synHQGenerator(SCO,HSQL):-
	nl,write('TRY 1'),nl,
	hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
	create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
	merge_all_dtfs(DTFS,DTF),
	int(DTF,SCO),
	sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 2'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 3'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 4'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 5'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 6'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 7'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 8'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 9'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 10'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 11'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 12'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 13'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 14'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 15'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 16'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 17'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 18'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 19'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 20'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 21'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 22'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 23'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 24'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 25'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 26'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 27'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 28'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 29'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 30'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 31'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 32'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 33'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 34'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 35'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 36'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 37'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 38'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 39'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
synHQGenerator(SCO,HSQL):-
	nl,write('TRY 40'),nl,
        hq_to_generate(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections),
        create_hq(NumberOfDS,NumberOfBindings,NumberOfJoins,NumberOfFilterings, NumberOfBlockingProjetions,NumberOfProjections, DTFS),
        merge_all_dtfs(DTFS,DTF),
        int(DTF,SCO),
        sco_to_hsql(SCO,HSQL),!.
