#!/bin/bash
for i in `seq 1995 2009`
do
    wget http://geo.phys.spbu.ru/~tsyganenko/TS05_data_and_stuff/${i}_OMNI_5m_with_TS05_variables.zip
done

for i in *.zip
do
    unzip $i; rm $i
done

cat *OMNI* > omni_ts05.dat
#rm *OMNI*
