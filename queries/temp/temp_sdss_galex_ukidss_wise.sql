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
  
  s.sdss_u_$$s_type$$mag sdss_u_mag,       s.sdss_u_$$s_type$$err sdss_u_err,
  s.sdss_g_$$s_type$$mag sdss_g_mag,       s.sdss_g_$$s_type$$err sdss_g_err, 
  s.sdss_r_$$s_type$$mag sdss_r_mag,       s.sdss_r_$$s_type$$err sdss_r_err,  
  s.sdss_i_$$s_type$$mag sdss_i_mag,       s.sdss_i_$$s_type$$err sdss_i_err, 
  s.sdss_z_$$s_type$$mag sdss_z_mag,       s.sdss_z_$$s_type$$err sdss_z_err,
  
  g.galex_objid,
  g.galex_nuv_$$g_type$$mag galex_nuv_mag,   g.galex_nuv_$$g_type$$err galex_nuv_err, 
  g.galex_fuv_$$g_type$$mag galex_fuv_mag,   g.galex_fuv_$$g_type$$err galex_fuv_err,
  
  u.ukidss_objid,
  u.ukidss_y_$$u_type$$mag ukidss_y_mag,     u.ukidss_y_$$u_type$$err ukidss_y_err,
  u.ukidss_j_$$u_type$$mag ukidss_j_mag,     u.ukidss_j_$$u_type$$err ukidss_j_err,
  u.ukidss_h_$$u_type$$mag ukidss_h_mag,     u.ukidss_h_$$u_type$$err ukidss_h_err,
  u.ukidss_k_$$u_type$$mag ukidss_k_mag,     u.ukidss_k_$$u_type$$err ukidss_k_err,
  
  w.sigra wise_sigra,w.sigdec wise_sigdec, w.cntr wise_cntr,
  w.wise_w1_$$w_type$$mag wise_w1_mag,     w.wise_w1_$$w_type$$err wise_w1_err,
  w.wise_w2_$$w_type$$mag wise_w2_mag,     w.wise_w2_$$w_type$$err wise_w2_err,
  w.wise_w3_$$w_type$$mag wise_w3_mag,     w.wise_w3_$$w_type$$err wise_w3_err,
  w.wise_w4_$$w_type$$mag wise_w4_mag,     w.wise_w4_$$w_type$$err wise_w4_err,

  w.w1snr        	wise_w1_snr,
  w.w1cov           wise_w1_cov,
  w.w2snr        	wise_w2_snr,
  w.w2cov           wise_w2_cov,
  w.w3snr        	wise_w3_snr,
  w.w3cov           wise_w3_cov,
  w.w4snr       	wise_w4_snr,
  w.w4cov           wise_w4_cov

INTO 
  $$SDSS_GALEX_UKIDSS_WISE$$

FROM
  Mydb.$$SDSS_OUT$$ s
  
left JOIN mydb.$$GALEX$$ g on s.sdss_dr8objid = g.sdss_dr8objid
left JOIN mydb.$$UKIDSS$$_fix u on s.sdss_dr8objid = u.sdss_dr8objid
left JOIN mydb.$$WISE$$_fix w on s.sdss_dr8objid = w.sdss_dr8objid
