postgresql to sqlite3

- Create a dump of the PostgreSQL database. ssh -C username@hostname.com pg_dump --data-only --inserts YOUR_DB_NAME > dump.sql
- Remove the lines starting with SET
- Remove the lines starting with SELECT pg_catalog.setval
- Replace true for ‘t’
- Replace false for ‘f’
- Add BEGIN; as first line and END; as last line
- sqlite3 freda.db(需要先把表创建好)
- sqlite> .read dump.sql

