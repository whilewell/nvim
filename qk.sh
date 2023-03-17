#!/bin/bash

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

qc(){
    cur_dir=`pwd`
    cur_dir=${cur_dir%/*}
    while true; do
        if [ -d "$cur_dir/.repo" -o -d "$cur_dir/.git" ];then
            cd $cur_dir
            break 
        fi
        cur_dir=${cur_dir%/*}
        [ "/home/xx" == "${cur_dir}" ] && break;
    done
}

qpwd(){
    cur_dir=`pwd`
    echo "$cur_dir/$@"
}

qdiff(){
    diff -r --no-dereference $@
}

qckjson(){
    cat $1 | python -m json.tool
}

qtag(){
    root_dir=`pwd`
    find $root_dir -name "*.h" -o -name "*.c" > cscope.files
    cscope -Rbkq -i cscope.files
    ctags -R
}

qrsync(){
    repo sync && repo start $RANDOM --all && repo manifest -ro tag.xml
}

qcl(){
    local code
    code=`cat ~/.codelist | fzf` && ${code}
}
