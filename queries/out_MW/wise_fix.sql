SELECT distinct *
FROM  mydb.S82T_wise my

into mydb.S82T_wise_fix

  WHERE
  my.dist_x IN (
  SELECT MIN(dist_x) 
  FROM mydb.S82T_wise
  WHERE old_sdss_dr8objid=my.old_sdss_dr8objid ) 