#!/bin/sh

find . -type f \( -name "*.cpp" -or -name "*.h" \) ! -path "*/.git/*" -print | while read f; do
		echo $f
		iconv -f GB2312 -t UTF-8 < "$f" > "$f.recode.$$"
		if [ $? -eq 0 ]; then
			rm -f "$f"
			mv -i "$f.recode.$$" "$f"
		else
			rm -f "$f.recode.$$"
		fi
done