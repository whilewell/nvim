qjy_get_content() {
	echo "start=========================="
	cat $1 | awk -F ',' '{for(i=1;i<=NF;i++){ print $i}}' | grep "content\"\:" | awk -F ':' '{print $2}' > subtitles.txt.tmp
	paste -d" " -s - < subtitles.txt.tmp > subtitles.txt
	rm subtitles.txt.tmp
	echo "end=========================="
}

qtag(){
    find `pwd` -name "*.c" -o -name "*.h" > ls.files && cscope -Rbkq -i ls.files && ctags -R
}
