SELECT distinct * 

INTO mydb.$$SDSS_GALEX_UKIDSS_WISE_X$$

FROM mydb.$$SDSS_GALEX_UKIDSS_WISE$$ s


JOIN mydb.$$CSC$$ c on s.sdss_dr8objid = c.sdss_dr8objid

