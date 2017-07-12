Create new database
  createdb mydb
  > login
    psql mydb


Start server command:
  /usr/local/Cellar/postgresql/9.5.0/bin/pg_ctl -D /Users/jwang/installs/postgres/data -l logfile start


pg commandline commands:
- create user: createuser -d -e -P <uname>
- connect as user: psql -U <uname> silverpop_db

pg_sql commands:
- check logged in users: select * from pg_stat_activity;


