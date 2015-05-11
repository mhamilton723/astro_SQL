SELECT distinct
my.sdss_dr7objid, 
my.sdss_dr8objid, 

g.objid galex_objid,

g.nuv_mag galex_nuv_calibmag, g.nuv_magerr galex_nuv_caliberr, 
g.fuv_mag galex_fuv_calibmag, g.fuv_magerr galex_fuv_caliberr,

g.nuv_mag_aper_1 galex_nuv_aper1mag, g.nuv_magerr_aper_1 galex_nuv_aper1err, 
g.fuv_mag_aper_1 galex_fuv_aper1mag, g.fuv_magerr_aper_1 galex_fuv_aper1err, 

g.nuv_mag_aper_2 galex_nuv_aper2mag, g.nuv_magerr_aper_2 galex_nuv_aper2err, 
g.fuv_mag_aper_2 galex_fuv_aper2mag, g.fuv_magerr_aper_2 galex_fuv_aper2err, 

g.nuv_mag_aper_3 galex_nuv_aper3mag, g.nuv_magerr_aper_3 galex_nuv_aper3err, 
g.fuv_mag_aper_3 galex_fuv_aper3mag, g.fuv_magerr_aper_3 galex_fuv_aper3err, 

g.nuv_mag_aper_4 galex_nuv_aper4mag, g.nuv_magerr_aper_4 galex_nuv_aper4err, 
g.fuv_mag_aper_4 galex_fuv_aper4mag, g.fuv_magerr_aper_4 galex_fuv_aper4err, 

g.nuv_mag_aper_5 galex_nuv_aper5mag, g.nuv_magerr_aper_5 galex_nuv_aper5err, 
g.fuv_mag_aper_5 galex_fuv_aper5mag, g.fuv_magerr_aper_5 galex_fuv_aper5err, 

g.nuv_mag_auto galex_nuv_automag, g.nuv_magerr_auto galex_nuv_autoerr, 
g.fuv_mag_auto galex_fuv_automag, g.fuv_magerr_auto galex_fuv_autoerr, 

g.nuv_mag_iso galex_nuv_isomag, g.nuv_magerr_iso galex_nuv_isoerr, 
g.fuv_mag_iso galex_fuv_isomag, g.fuv_magerr_iso galex_fuv_isoerr 

FROM  mydb.$$SDSS_OUT$$ my

into mydb.$$GALEX$$

JOIN Galexgr6.xSDSSDR7 x on my.sdss_dr7objid = x.sdssobjid
JOIN Galexgr6.PhotoOBJall g on x.objid=g.objid

WHERE
x.reverseDistanceRank=1
and x.distance<1
