SELECT 
s7.dr7objID   sdss_dr7objid, 
s7.dr8objID   sdss_dr8objid, 

my.RA, my.DEC, my.z, 
s.fiberMag_u sdss_u_mag, s.fiberMagErr_u sdss_u_err,
s.fiberMag_g sdss_g_mag, s.fiberMagErr_g sdss_g_err, 
s.fiberMag_r sdss_r_mag, s.fiberMagErr_r sdss_r_err, 
s.fiberMag_i sdss_i_mag, s.fiberMagErr_i sdss_i_err, 
s.fiberMag_z sdss_z_mag, s.fiberMagErr_z sdss_z_err,

g.objid galex_objid,
g.nuv_mag_aper_1 galex_nuv_mag, g.nuv_magerr_aper_1 galex_nuv_err, 
g.fuv_mag_aper_1 galex_fuv_mag, g.fuv_magerr_aper_1 galex_fuv_err 

FROM Dr9.PhotoObjAll s, Dr9.PhotoObjDR7 s7, Galexgr6.xSDSSDR7 x, Galexgr6.PhotoOBJall g, mydb.sdssfix my

WHERE
my.objid = s7.dr8objID
and s7.dr8objID=s.objid
and s7.dr7objid = x.sdssobjid
and x.objid=g.objid
and x.reverseDistanceRank=1
and x.distance<1
