SELECT distinct *
FROM  mydb.$$WISE$$ my

into mydb.$$WISE$$_fix

  WHERE
  my.dist_x IN (
  SELECT MIN(dist_x) 
  FROM mydb.$$WISE$$
  WHERE old_sdss_dr8objid=my.old_sdss_dr8objid ) 