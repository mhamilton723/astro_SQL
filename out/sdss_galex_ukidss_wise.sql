SELECT distinct
  s.sdss_dr7objid,
  s.sdss_dr8objid,
  s.RA, s.DEC, s.z z_spec, u.eBV,
  petroRad_u,petroRad_g,petroRad_r,petroRad_i,petroRad_z,
  s.petroR90_u, s.petroR90_g, s.petroR90_r, s.petroR90_i, s.petroR90_z,
  s.probPSF,
  
  s.extinction_u,
  s.extinction_g,
  s.extinction_r,
  s.extinction_i,
  s.extinction_z,
  
  s.sdss_u_modelmag sdss_u_mag,       s.sdss_u_modelerr sdss_u_err,
  s.sdss_g_modelmag sdss_g_mag,       s.sdss_g_modelerr sdss_g_err, 
  s.sdss_r_modelmag sdss_r_mag,       s.sdss_r_modelerr sdss_r_err,  
  s.sdss_i_modelmag sdss_i_mag,       s.sdss_i_modelerr sdss_i_err, 
  s.sdss_z_modelmag sdss_z_mag,       s.sdss_z_modelerr sdss_z_err,
  
  g.galex_objid,
  g.galex_nuv_calibmag galex_nuv_mag,   g.galex_nuv_caliberr galex_nuv_err, 
  g.galex_fuv_calibmag galex_fuv_mag,   g.galex_fuv_caliberr galex_fuv_err,
  
  u.ukidss_objid,
  u.ukidss_y_petromag ukidss_y_mag,     u.ukidss_y_petroerr ukidss_y_err,
  u.ukidss_j_petromag ukidss_j_mag,     u.ukidss_j_petroerr ukidss_j_err,
  u.ukidss_h_petromag ukidss_h_mag,     u.ukidss_h_petroerr ukidss_h_err,
  u.ukidss_k_petromag ukidss_k_mag,     u.ukidss_k_petroerr ukidss_k_err,
  
  w.sigra wise_sigra,w.sigdec wise_sigdec, w.cntr wise_cntr,
  w.wise_w1_aper1mag wise_w1_mag,     w.wise_w1_aper1err wise_w1_err,
  w.wise_w2_aper1mag wise_w2_mag,     w.wise_w2_aper1err wise_w2_err,
  w.wise_w3_aper1mag wise_w3_mag,     w.wise_w3_aper1err wise_w3_err,
  w.wise_w4_aper1mag wise_w4_mag,     w.wise_w4_aper1err wise_w4_err,

  w.w1snr        	wise_w1_snr,
  w.w1cov           wise_w1_cov,
  w.w2snr        	wise_w2_snr,
  w.w2cov           wise_w2_cov,
  w.w3snr        	wise_w3_snr,
  w.w3cov           wise_w3_cov,
  w.w4snr       	wise_w4_snr,
  w.w4cov           wise_w4_cov

INTO 
  AGN_sdss_galex_ukidss_wise

FROM
  Mydb.AGN_sdssfix s
  
left JOIN mydb.AGN_galex g on s.sdss_dr8objid = g.sdss_dr8objid
left JOIN mydb.AGN_ukidss_fix u on s.sdss_dr8objid = u.sdss_dr8objid
left JOIN mydb.AGN_wise_fix w on s.sdss_dr8objid = w.sdss_dr8objid