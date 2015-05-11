
# curl command and fixed parameters
$baseCurlCmd='curl http://surveys.roe.ac.uk:8080/wsa/WSASQL  -F "formaction=freeform" -F "database=UKIDSSDR9PLUS" '.
    ' -F "sqlstmt=<sql1.txt" -F "iFmt=CSV" -F "format=CSV" -F "compress=GZIP" -F "rows=1" -F "timeout=10800"';

$fileExtension=".csv.gz"; # extension used to search output, change if you change outpur format format=CSV, compress=GZIP

print "$loop \n";
$uploadFile="foo.csv"; # file to load as #usertbale
$outFile="output.html"; # file name for output webpage
$curlCmd=$baseCurlCmd.' -F "uploadFileToTable=@'.$uploadFile.'" -o '.$outFile; # full curl command
$resultsFile="results".$fileExtension; # file to down load results to
print "$curlCmd \n";
$tempOut=`$curlCmd`; # run the curl command
# parse the output webpage
 open (OUT,"<$outFile"); 
$found=0;
while (<OUT>){
    last if $found==1;
        $record=$_;
    if ($record =~ /dl_id/){
        $found=1;
		print "$record \n";
		$endPos=index($record,$fileExtension);
		$strtPos=rindex(substr($record,0,$endPos),"http");
		$fileURL=substr($record,$strtPos,$endPos-$strtPos+length($fileExtension));
		print "$fileURL \n";
        $tempout1=`curl $fileURL -o  $resultsFile`; # retries the results file
	}
}
close(OUT);


