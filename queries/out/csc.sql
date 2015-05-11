SELECT distinct * 

INTO mydb.X_AGN_sdss_galex_ukidss_wisepro_aper

FROM mydb.AGN_sdss_galex_ukidss_wisepro_aper s


JOIN mydb.xmm_crossid c on s.sdss_dr8objid = c.sdss_dr8objid

where join_proba_id>.95