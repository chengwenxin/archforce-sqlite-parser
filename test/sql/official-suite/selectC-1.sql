-- original: selectC.test
-- credit:   http://www.sqlite.org/src/tree?ci=trunk&name=test

CREATE TABLE t1(a, b, c);
    INSERT INTO t1 VALUES(1,'aaa','bbb');
    INSERT INTO t1 SELECT * FROM t1;
    INSERT INTO t1 VALUES(2,'ccc','ddd');

    SELECT DISTINCT a AS x, b||c AS y
      FROM t1
     WHERE y IN ('aaabbb','xxx')
;SELECT DISTINCT a AS x, b||c AS y
      FROM t1
     WHERE b||c IN ('aaabbb','xxx')
;SELECT DISTINCT a AS x, b||c AS y
      FROM t1
     WHERE y='aaabbb'
;SELECT DISTINCT a AS x, b||c AS y
      FROM t1
     WHERE b||c='aaabbb'
;SELECT DISTINCT a AS x, b||c AS y
      FROM t1
     WHERE x=2
;SELECT DISTINCT a AS x, b||c AS y
      FROM t1
     WHERE a=2
;SELECT DISTINCT a AS x, b||c AS y
      FROM t1
     WHERE +y='aaabbb'
;SELECT a AS x, b||c AS y
      FROM t1
     GROUP BY x, y
    HAVING y='aaabbb'
;SELECT a AS x, b||c AS y
      FROM t1
     GROUP BY x, y
    HAVING b||c='aaabbb'
;SELECT a AS x, b||c AS y
      FROM t1
     WHERE y='aaabbb'
     GROUP BY x, y
;SELECT a AS x, b||c AS y
      FROM t1
     WHERE b||c='aaabbb'
     GROUP BY x, y
;SELECT DISTINCT upper(b) AS x
      FROM t1
     ORDER BY x
;SELECT DISTINCT uppercaseconversionfunctionwithaverylongname(b) AS x
      FROM t1
     ORDER BY x
;SELECT upper(b) AS x
      FROM t1
     GROUP BY x
     ORDER BY x
;SELECT uppercaseconversionfunctionwithaverylongname(b) AS x
      FROM t1
     GROUP BY x
     ORDER BY x
;SELECT upper(b) AS x
      FROM t1
     ORDER BY x DESC
;SELECT uppercaseconversionfunctionwithaverylongname(b) AS x
      FROM t1
     ORDER BY x DESC
;CREATE TABLE person (
        org_id          TEXT NOT NULL,
        nickname        TEXT NOT NULL,
        license         TEXT,
        CONSTRAINT person_pk PRIMARY KEY (org_id, nickname),
        CONSTRAINT person_license_uk UNIQUE (license)
    );
    INSERT INTO person VALUES('meyers', 'jack', '2GAT123');
    INSERT INTO person VALUES('meyers', 'hill', 'V345FMP');
    INSERT INTO person VALUES('meyers', 'jim', '2GAT138');
    INSERT INTO person VALUES('smith', 'maggy', '');
    INSERT INTO person VALUES('smith', 'jose', 'JJZ109');
    INSERT INTO person VALUES('smith', 'jack', 'THX138');
    INSERT INTO person VALUES('lakeside', 'dave', '953OKG');
    INSERT INTO person VALUES('lakeside', 'amy', NULL);
    INSERT INTO person VALUES('lake-apts', 'tom', NULL);
    INSERT INTO person VALUES('acorn', 'hideo', 'CQB421');
    
    SELECT 
      org_id, 
      count((NOT (org_id IS NULL)) AND (NOT (nickname IS NULL)))
    FROM person 
    WHERE (CASE WHEN license != '' THEN 1 ELSE 0 END)
    GROUP BY 1
;CREATE TABLE t2(a PRIMARY KEY, b);
    INSERT INTO t2 VALUES('abc', 'xxx');
    INSERT INTO t2 VALUES('def', 'yyy');
    SELECT a, max(b || a) FROM t2 WHERE (b||b||b)!='value' GROUP BY a
;SELECT b, max(a || b) FROM t2 WHERE (b||b||b)!='value' GROUP BY a
;create table t_distinct_bug (a, b, c);
  insert into t_distinct_bug values ('1', '1', 'a');
  insert into t_distinct_bug values ('1', '2', 'b');
  insert into t_distinct_bug values ('1', '3', 'c');
  insert into t_distinct_bug values ('1', '1', 'd');
  insert into t_distinct_bug values ('1', '2', 'e');
  insert into t_distinct_bug values ('1', '3', 'f')
;select a from (select distinct a, b from t_distinct_bug)
;select a, udf() from (select distinct a, b from t_distinct_bug);