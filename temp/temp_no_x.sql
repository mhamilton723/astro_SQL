SELECT * 

INTO mydb.$$SDSS_GALEX_UKIDSS_WISE_NOX$$

FROM mydb.$$SDSS_GALEX_UKIDSS_WISE$$ s

Where s.sdss_dr7objID not in ( 
    select fix.sdss_dr7objID from mydb.$$CSC$$ fix)