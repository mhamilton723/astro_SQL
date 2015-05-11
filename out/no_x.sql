SELECT * 

INTO mydb.NOX_AGN_sdss_galex_ukidss_wise

FROM mydb.AGN_sdss_galex_ukidss_wise s

Where s.sdss_dr7objID not in ( 
    select fix.sdss_dr7objID from mydb.all_xray_fix fix)