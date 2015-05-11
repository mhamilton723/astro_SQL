SELECT distinct *

FROM  mydb.$$UKIDSS$$ my

into mydb.$$UKIDSS$$_fix

WHERE

 my.distanceMins IN (
  SELECT MIN(distanceMins) 
  FROM mydb.$$UKIDSS$$
  WHERE sdss_dr8Objid=my.sdss_dr8Objid) 
