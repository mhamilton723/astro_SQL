SELECT distinct
my.old_sdss_dr8objid, 
my.new_sdss_dr8objid, 

w.cntr,w.ra,w.dec,w.sigra,w.sigdec,X.match_dist as dist_x,

w.w1mpro wise_w1_promag,w.w1sigmpro wise_w1_proerr,        
w.w2mpro wise_w2_promag,w.w2sigmpro wise_w2_proerr,        
w.w3mpro wise_w3_promag,w.w3sigmpro wise_w3_proerr,        
w.w4mpro wise_w4_promag,w.w4sigmpro wise_w4_proerr,        

w.w1mag wise_w1_apermag,w.w1sigmag wise_w1_apererr,
w.w2mag wise_w2_apermag,w.w2sigmag wise_w2_apererr,
w.w3mag wise_w3_apermag,w.w3sigmag wise_w3_apererr,
w.w4mag wise_w4_apermag,w.w4sigmag wise_w4_apererr,

w.w1mag_1 wise_w1_aper1mag,w.w1sigmag_1 wise_w1_aper1err,
w.w2mag_1 wise_w2_aper1mag,w.w2sigmag_1 wise_w2_aper1err,
w.w3mag_1 wise_w3_aper1mag,w.w3sigmag_1 wise_w3_aper1err,
w.w4mag_1 wise_w4_aper1mag,w.w4sigmag_1 wise_w4_aper1err,

w.w2mag_2 wise_w1_aper2mag,w.w1sigmag_2 wise_w1_aper2err,
w.w2mag_2 wise_w2_aper2mag,w.w2sigmag_2 wise_w2_aper2err,
w.w3mag_2 wise_w3_aper2mag,w.w3sigmag_2 wise_w3_aper2err,
w.w4mag_2 wise_w4_aper2mag,w.w4sigmag_2 wise_w4_aper2err,

w.w3mag_3 wise_w1_aper3mag,w.w1sigmag_3 wise_w1_aper3err,
w.w3mag_3 wise_w2_aper3mag,w.w2sigmag_3 wise_w2_aper3err,
w.w3mag_3 wise_w3_aper3mag,w.w3sigmag_3 wise_w3_aper3err,
w.w4mag_3 wise_w4_aper3mag,w.w4sigmag_3 wise_w4_aper3err,

w.w4mag_4 wise_w1_aper4mag,w.w1sigmag_4 wise_w1_aper4err,
w.w4mag_4 wise_w2_aper4mag,w.w2sigmag_4 wise_w2_aper4err,
w.w4mag_4 wise_w3_aper4mag,w.w3sigmag_4 wise_w3_aper4err,
w.w4mag_4 wise_w4_aper4mag,w.w4sigmag_4 wise_w4_aper4err,

w.w1gmag wise_w1_gmag,w.w1siggmag wise_w1_gerr,
w.w2gmag wise_w2_gmag,w.w2siggmag wise_w2_gerr,
w.w3gmag wise_w3_gmag,w.w3siggmag wise_w3_gerr,
w.w4gmag wise_w4_gmag,w.w4siggmag wise_w4_gerr,

w.w1snr,w.w1cov,
w.w2snr,w.w2cov,
w.w3snr,w.w3cov,
w.w4snr,w.w4cov

into mydb.$$WISE$$

from dr10.wise_allsky as w
  join dr10.wise_xmatch as X on  X.wise_cntr =  w.cntr
  join  myDB.$$SDSS_OUT$$ my  on X.sdss_objid = my.old_sdss_dr8objid
and X.match_dist<3

where my.WISE_REJ = 'no'
