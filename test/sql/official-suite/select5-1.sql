-- original: select5.test
-- credit:   http://www.sqlite.org/src/tree?ci=trunk&name=test

CREATE TABLE t1(x int, y int);
  BEGIN
;COMMIT
;SELECT DISTINCT y FROM t1 ORDER BY y
;SELECT y, count(*) FROM t1 GROUP BY y ORDER BY y
;SELECT y, count(*) FROM t1 GROUP BY y ORDER BY count(*), y
;SELECT count(*), y FROM t1 GROUP BY y ORDER BY count(*), y
;SELECT x, count(*), avg(y) FROM t1 GROUP BY x HAVING x<4 ORDER BY x
;SELECT avg(x) FROM t1 WHERE x>100
;SELECT count(x) FROM t1 WHERE x>100
;SELECT min(x) FROM t1 WHERE x>100
;SELECT max(x) FROM t1 WHERE x>100
;SELECT sum(x) FROM t1 WHERE x>100
;CREATE TABLE t2(a, b, c);
    INSERT INTO t2 VALUES(1, 2, 3);
    INSERT INTO t2 VALUES(1, 4, 5);
    INSERT INTO t2 VALUES(6, 4, 7);
    CREATE INDEX t2_idx ON t2(a)
;SELECT a FROM t2 GROUP BY a
;SELECT a FROM t2 WHERE a>2 GROUP BY a
;SELECT a, b FROM t2 GROUP BY a, b
;SELECT a, b FROM t2 GROUP BY a
;SELECT max(c), b*a, b, a FROM t2 GROUP BY b*a, b, a
;CREATE TABLE t3(x,y);
    INSERT INTO t3 VALUES(1,NULL);
    INSERT INTO t3 VALUES(2,NULL);
    INSERT INTO t3 VALUES(3,4);
    SELECT count(x), y FROM t3 GROUP BY y ORDER BY 1
;CREATE TABLE t4(x,y,z);
    INSERT INTO t4 VALUES(1,2,NULL);
    INSERT INTO t4 VALUES(2,3,NULL);
    INSERT INTO t4 VALUES(3,NULL,5);
    INSERT INTO t4 VALUES(4,NULL,6);
    INSERT INTO t4 VALUES(4,NULL,6);
    INSERT INTO t4 VALUES(5,NULL,NULL);
    INSERT INTO t4 VALUES(5,NULL,NULL);
    INSERT INTO t4 VALUES(6,7,8);
    SELECT max(x), count(x), y, z FROM t4 GROUP BY y, z ORDER BY 1
;SELECT count(*), count(x) as cnt FROM t4 GROUP BY y ORDER BY cnt
;CREATE TABLE t8a(a,b);
    CREATE TABLE t8b(x);
    INSERT INTO t8a VALUES('one', 1);
    INSERT INTO t8a VALUES('one', 2);
    INSERT INTO t8a VALUES('two', 3);
    INSERT INTO t8a VALUES('one', NULL);
    INSERT INTO t8b(rowid,x) VALUES(1,111);
    INSERT INTO t8b(rowid,x) VALUES(2,222);
    INSERT INTO t8b(rowid,x) VALUES(3,333);
    SELECT a, count(b) FROM t8a, t8b WHERE b=t8b.rowid GROUP BY a ORDER BY a
;SELECT a, count(b) FROM t8a, t8b WHERE b=+t8b.rowid GROUP BY a ORDER BY a
;SELECT t8a.a, count(t8a.b) FROM t8a, t8b WHERE t8a.b=t8b.rowid
     GROUP BY 1 ORDER BY 1
;SELECT a, count(*) FROM t8a, t8b WHERE b=+t8b.rowid GROUP BY a ORDER BY a
;SELECT a, count(b) FROM t8a, t8b WHERE b<x GROUP BY a ORDER BY a
;SELECT a, count(t8a.b) FROM t8a, t8b WHERE b=t8b.rowid 
     GROUP BY a ORDER BY 2
;SELECT a, count(b) FROM t8a, t8b GROUP BY a ORDER BY 2
;SELECT a, count(*) FROM t8a, t8b GROUP BY a ORDER BY 2;