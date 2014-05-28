export CONFIG_FILE=$1
cd /Users/aguacatin/Research/HADAS/PhD/Prolog/hyqoz_synHQGen/
/opt/local/bin/gprolog --init-goal "['load.pl','${CONFIG_FILE}']" --entry-goal "synHQGenerator(SCO,HSQL),nl,nl,write('SCO = '),write(SCO),nl,nl,write('HSQL = '),write(HSQL),write(';'),nl,nl" --query-goal "halt" | egrep "SCO|HSQL"
