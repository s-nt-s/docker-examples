#!/usr/bin/env python3

import psycopg2
import logging


class PostgreSQL:
    def __init__(self, config):
        host, db, user, psw = config.split()
        logging.info("... {} en {}".format(db, host))
        self.con = psycopg2.connect(
            host=host, database=db, user=user, password=psw)
        logging.info("OK: {} en {}".format(db, host))

    def close(self):
        self.con.commit()
        self.con.close()

    def select(self, sql, **kargv):
        c = self.con.cursor(**kargv)
        c.execute(sql)
        for r in c.fetchall():
            yield r
        c.close()

    def one(self, sql):
        c = self.con.cursor()
        c.execute(sql)
        r = c.fetchone()
        if r is not None and len(r) == 1:
            r = r[0]
        c.close()
        return r

    def version(self):
        return self.one("SELECT version()")

if __name__ == "__main__":
    db = PostgreSQL(os.environ['DB'])
    print(db.version())
    db.close()
