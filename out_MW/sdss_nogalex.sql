SELECT 
s.dr7objID   sdss_dr7objid, 
s.dr8objID    sdss_dr8objid, 
my.RA, my.DEC, my.z, 
s.fiberMag_u sdss_u_mag, s.fiberMagErr_u sdss_u_err,
s.fiberMag_g sdss_g_mag, s.fiberMagErr_g sdss_g_err, 
s.fiberMag_r sdss_r_mag, s.fiberMagErr_r sdss_r_err, 
s.fiberMag_i sdss_i_mag, s.fiberMagErr_i sdss_i_err, 
s.fiberMag_z sdss_z_mag, s.fiberMagErr_z sdss_z_err

INTO sdssfix_nogalex_aper_CL

From Dr10.PhotoObjDR7 s, mydb.sdssfix my

WHERE
my.objid = s.dr8objID
and s.dr8objID not in ( 
    select fix.sdss_dr8objID from mydb.sdssfix_galex_aper fix)
