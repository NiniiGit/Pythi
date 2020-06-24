#!/bin/bash
source ~/.bashrc

Environment={{usage}}
DB_list='{{db}}'


for Item in $DB_list ;

  do
    check_dbgate_db $Environment $Item
    echo $Item

  done
