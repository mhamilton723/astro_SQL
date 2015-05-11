SELECT distinct *
FROM  mydb.AGN_wise my

into mydb.AGN_wise_fix

  WHERE
  my.dist_x IN (
  SELECT MIN(dist_x) 
  FROM mydb.AGN_wise
  WHERE sdss_dr8objid=my.sdss_dr8objid ) 