SELECT distinct * 

INTO mydb.X_AGN_sdss_galex_ukidss_wise

FROM mydb.AGN_sdss_galex_ukidss_wise s


JOIN mydb.all_xray_fix c on s.sdss_dr8objid = c.sdss_dr8objid

