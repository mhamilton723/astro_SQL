#!bin/bash/
SDSS_OUT_FN=$(find data -name "$$SDSS_OUT$$.csv")
SDSS_OUT_IPAC_FN=$(find data -name "$$SDSS_OUT$$_ipac.tbl")

curl -F filename=@$SDSS_OUT_IPAC_FN \
-F spatial=Upload \
-F uradius=1 \
-F uradunits=arcsec \
-F catalog=wise_allwise_p3as_psd \
-F outfmt=1 \
-F selcols=designation,cntr,sigra,sigdec,w1mpro,w1sigmpro,w1snr,w2mpro,w2sigmpro,w2snr,w3mpro,w3sigmpro,w3snr,w4mpro,w4sigmpro,w4snr \
"http://irsa.ipac.caltech.edu/cgi-bin/Gator/nph-query" \
-o data/$$WISE$$_raw.tbl 



perl queries/out_MW/curlUp.pl
