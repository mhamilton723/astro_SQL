SELECT distinct
s7.dr7objID   sdss_dr7objid, 
s7.dr8objID   sdss_dr8objid, 

my.RA, my.DEC, my.z,
petroRad_u,petroRad_g,petroRad_r,petroRad_i,petroRad_z,
s.petroR90_u, s.petroR90_g, s.petroR90_r, s.petroR90_i, s.petroR90_z,
s.probPSF,

s.extinction_u,
s.extinction_g,
s.extinction_r,
s.extinction_i,
s.extinction_z,

s.devmag_u sdss_u_devmag, s.devmagErr_u sdss_u_deverr,
s.devmag_g sdss_g_devmag, s.devmagErr_g sdss_g_deverr, 
s.devmag_r sdss_r_devmag, s.devmagErr_r sdss_r_deverr, 
s.devmag_i sdss_i_devmag, s.devmagErr_i sdss_i_deverr, 
s.devmag_z sdss_z_devmag, s.devmagErr_z sdss_z_deverr,

s.modelmag_u sdss_u_modelmag, s.modelmagErr_u sdss_u_modelerr,
s.modelmag_g sdss_g_modelmag, s.modelmagErr_g sdss_g_modelerr, 
s.modelmag_r sdss_r_modelmag, s.modelmagErr_r sdss_r_modelerr, 
s.modelmag_i sdss_i_modelmag, s.modelmagErr_i sdss_i_modelerr, 
s.modelmag_z sdss_z_modelmag, s.modelmagErr_z sdss_z_modelerr,

s.cmodelmag_u sdss_u_cmodelmag, s.cmodelmagErr_u sdss_u_cmodelerr,
s.cmodelmag_g sdss_g_cmodelmag, s.cmodelmagErr_g sdss_g_cmodelerr, 
s.cmodelmag_r sdss_r_cmodelmag, s.cmodelmagErr_r sdss_r_cmodelerr, 
s.cmodelmag_i sdss_i_cmodelmag, s.cmodelmagErr_i sdss_i_cmodelerr, 
s.cmodelmag_z sdss_z_cmodelmag, s.cmodelmagErr_z sdss_z_cmodelerr,

s.petroMag_u sdss_u_petromag, s.petroMagErr_u sdss_u_petroerr,
s.petroMag_g sdss_g_petromag, s.petroMagErr_g sdss_g_petroerr, 
s.petroMag_r sdss_r_petromag, s.petroMagErr_r sdss_r_petroerr, 
s.petroMag_i sdss_i_petromag, s.petroMagErr_i sdss_i_petroerr, 
s.petroMag_z sdss_z_petromag, s.petroMagErr_z sdss_z_petroerr,

s.fiber2Mag_u sdss_u_fiber2mag, s.fiber2MagErr_u sdss_u_fiber2err,
s.fiber2Mag_g sdss_g_fiber2mag, s.fiber2MagErr_g sdss_g_fiber2err, 
s.fiber2Mag_r sdss_r_fiber2mag, s.fiber2MagErr_r sdss_r_fiber2err, 
s.fiber2Mag_i sdss_i_fiber2mag, s.fiber2MagErr_i sdss_i_fiber2err, 
s.fiber2Mag_z sdss_z_fiber2mag, s.fiber2MagErr_z sdss_z_fiber2err, 

s.fiberMag_u sdss_u_fibermag, s.fiberMagErr_u sdss_u_fibererr,
s.fiberMag_g sdss_g_fibermag, s.fiberMagErr_g sdss_g_fibererr, 
s.fiberMag_r sdss_r_fibermag, s.fiberMagErr_r sdss_r_fibererr, 
s.fiberMag_i sdss_i_fibermag, s.fiberMagErr_i sdss_i_fibererr, 
s.fiberMag_z sdss_z_fibermag, s.fiberMagErr_z sdss_z_fibererr 

into mydb.AGN_sdssfix  from Dr10.PhotoObj s

JOIN Dr10.PhotoObjDR7 s7 ON s7.dr8objID=s.objid
JOIN mydb.AGN_sdss my ON s7.dr8objid=my.objid
