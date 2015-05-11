IF (SELECT count(my.old_sdss_dr8objid) FROM mydb.S82T_sdssfix my WHERE my.old_sdss_dr8objid IN(select h.old_sdss_dr8objid from mydb.S82T_sdssfix_1 h)) <> 0 and 
(SELECT count(my.old_sdss_dr8objid) FROM mydb.S82T_sdssfix my WHERE my.old_sdss_dr8objid IN(select a.matched_id from mydb.variable_SDSS_sources_xmatch a)) <> 0
  
BEGIN
update q 

SET 
q.new_sdss_dr8objid = my2.new_sdss_dr8objid,

q.petroRad_u = my2.petroRad_u,
q.petroRad_g = my2.petroRad_g,
q.petroRad_r = my2.petroRad_r,
q.petroRad_i = my2.petroRad_i,
q.petroRad_z = my2.petroRad_z,
q.petroR90_u = my2.petroR90_u,
q.petroR90_g = my2.petroR90_g,
q.petroR90_r = my2.petroR90_r,
q.petroR90_i = my2.petroR90_i,
q.petroR90_z = my2.petroR90_z,
q.probPSF = my2.probPSF,
 
q.sdss_u_devmag = my2.sdss_u_devmag,
q.sdss_u_deverr = my2.sdss_u_deverr, 
q.sdss_g_devmag = my2.sdss_g_devmag,
q.sdss_g_deverr = my2.sdss_g_deverr,
q.sdss_r_devmag = my2.sdss_r_devmag,
q.sdss_r_deverr = my2.sdss_r_deverr,
q.sdss_i_devmag = my2.sdss_i_devmag,
q.sdss_i_deverr = my2.sdss_i_deverr,
q.sdss_z_devmag = my2.sdss_z_devmag,
q.sdss_z_deverr = my2.sdss_z_deverr,
 
q.sdss_u_modelmag = my2.sdss_u_modelmag,
q.sdss_u_modelerr = my2.sdss_u_modelerr,
q.sdss_g_modelmag = my2.sdss_g_modelmag,
q.sdss_g_modelerr = my2.sdss_g_modelerr,
q.sdss_r_modelmag = my2.sdss_r_modelmag,
q.sdss_r_modelerr = my2.sdss_r_modelerr,
q.sdss_i_modelmag = my2.sdss_i_modelmag,
q.sdss_i_modelerr = my2.sdss_i_modelerr,
q.sdss_z_modelmag = my2.sdss_z_modelmag,
q.sdss_z_modelerr = my2.sdss_z_modelerr,
 
q.sdss_u_cmodelmag = my2.sdss_u_cmodelmag,
q.sdss_u_cmodelerr = my2.sdss_u_cmodelerr,
q.sdss_g_cmodelmag = my2.sdss_g_cmodelmag,
q.sdss_g_cmodelerr = my2.sdss_g_cmodelerr,
q.sdss_r_cmodelmag = my2.sdss_r_cmodelmag,
q.sdss_r_cmodelerr = my2.sdss_r_cmodelerr,
q.sdss_i_cmodelmag = my2.sdss_i_cmodelmag,
q.sdss_i_cmodelerr = my2.sdss_i_cmodelerr,
q.sdss_z_cmodelmag = my2.sdss_z_cmodelmag,
q.sdss_z_cmodelerr = my2.sdss_z_cmodelerr,
 
q.sdss_u_petromag = my2.sdss_u_petromag,
q.sdss_u_petroerr = my2.sdss_u_petroerr,
q.sdss_g_petromag = my2.sdss_g_petromag,
q.sdss_g_petroerr = my2.sdss_g_petroerr,
q.sdss_r_petromag = my2.sdss_r_petromag,
q.sdss_r_petroerr = my2.sdss_r_petroerr,
q.sdss_i_petromag = my2.sdss_i_petromag,
q.sdss_i_petroerr = my2.sdss_i_petroerr,
q.sdss_z_petromag = my2.sdss_z_petromag,
q.sdss_z_petroerr = my2.sdss_z_petroerr,
 
q.sdss_u_fiber2mag = my2.sdss_u_fiber2mag,
q.sdss_u_fiber2err = my2.sdss_u_fiber2err,
q.sdss_g_fiber2mag = my2.sdss_g_fiber2mag,
q.sdss_g_fiber2err = my2.sdss_g_fiber2err,
q.sdss_r_fiber2mag = my2.sdss_r_fiber2mag,
q.sdss_r_fiber2err = my2.sdss_r_fiber2err,
q.sdss_i_fiber2mag = my2.sdss_i_fiber2mag,
q.sdss_i_fiber2err = my2.sdss_i_fiber2err,
q.sdss_z_fiber2mag = my2.sdss_z_fiber2mag,
q.sdss_z_fiber2err = my2.sdss_z_fiber2err,
 
q.sdss_u_fibermag = my2.sdss_u_fibermag,
q.sdss_u_fibererr = my2.sdss_u_fibererr,
q.sdss_g_fibermag = my2.sdss_g_fibermag,
q.sdss_g_fibererr = my2.sdss_g_fibererr,
q.sdss_r_fibermag = my2.sdss_r_fibermag,
q.sdss_r_fibererr = my2.sdss_r_fibererr,
q.sdss_i_fibermag = my2.sdss_i_fibermag,
q.sdss_i_fibererr = my2.sdss_i_fibererr,
q.sdss_z_fibermag = my2.sdss_z_fibermag,
q.sdss_z_fibererr = my2.sdss_z_fibererr

from mydb.S82T_sdssfix_1 my2

INNER JOIN mydb.S82T_sdssfix q ON q.old_sdss_dr8objid=my2.old_sdss_dr8objid

where my2.date_diff = (select min(date_diff) from mydb.S82T_sdssfix_1 as f where f.old_sdss_dr8objid = my2.old_sdss_dr8objid) 


END