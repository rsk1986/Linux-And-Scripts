find /sascommon -type f -exec grep -l kdcp945 {} \;

nohup find /sascommon -type f -exec grep -li SESKLSASGRNPR4 {} \; > /tmp/output_.txt 2> /tmp/error_.txt &