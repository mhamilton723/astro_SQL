SELECT distinct *

FROM  mydb.AGN_ukidss my

into mydb.AGN_ukidss_fix

WHERE

 my.distanceMins IN (
  SELECT MIN(distanceMins) 
  FROM mydb.AGN_ukidss
  WHERE sdss_dr8Objid=my.sdss_dr8Objid) 
