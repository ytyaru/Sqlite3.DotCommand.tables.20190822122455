SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"

sqlite3 :memory: ".tables"

sqlite3 :memory: \
"create table MyTable(C text);" \
".tables"

sqlite3 :memory: \
"create table MyTable(C text);" \
".ta"

sqlite3 :memory: \
"create table MyTable(C text);" \
"create table HAHAHA(C text);" \
".tables"

sqlite3 :memory: \
"create table MyTable(C text);" \
"create table HAHAHA(C text);" \
'create table "HI HI HI"("C C C" text);' \
".tables"

sqlite3 :memory: \
"create table MyTable(C text);" \
"create table HAHAHA(C text);" \
'create table "HI HI HI"("C C C" text);' \
".tables" | grep 'HI HI HI'

sqlite3 :memory: \
"create table MyTable(C text);" \
"create table HAHAHA(C text);" \
'create table "HI HI HI"("C C C" text);' \
".tables" | tr -s ' ' | tr ' ' '\n'

sqlite3 :memory: \
"create table MyTable(C text);" \
"create table HAHAHA(C text);" \
'create table "HI HI HI"("C C C" text);' \
"select name from sqlite_master;"

sqlite3 :memory: \
"create table MyTable(C text);" \
"create table HAHAHA(C text);" \
'create table "HI HI HI"("C C C" text);' \
'create table "FU\nFU\nFU"("C\nC\nC" text);' \
"select name from sqlite_master;"

