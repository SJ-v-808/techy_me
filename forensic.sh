#!/bin/bash

#clearing screen
clear

#global_var
ico="(forensic)"
sig=" $ "
ef=

#functions
main_menu () {
	echo -n "${ico}${sig}"
	read option
	ef=${option}	
	comparission
}

comparission () {
	if [ $ef == "use_tools" ]
	then
		while true
		do
			echo -n "${ico} use_tools${sig}"
			read use_tools
			if [ $use_tools == "back" ]
			then
				break
			elif [ $use_tools == "show_exif" ]
			then
				echo "[files]"
				echo "#" 
				ls
				echo "#"
				echo -n "${ico} use_tools [file]${sig}"
				read fname 
				exiftool $fname
				
			elif [ $use_tools == "show_f_in_f" ]
			then
				echo "[files]"
				echo "#" 
				ls
				echo "#"
				echo -n "${ico} use_tools [file]${sig}"
				read fname
				binwalk $fname
			elif [ $use_tools == "extract_f_in_f" ]
			then
				echo "[files]"
				echo "#" 
				ls
				echo "#"
				echo -n "${ico} use_tools [file]${sig}"
				read fname
				binwalk -e $fname

			elif [ $use_tools == "show_hex" ]
			then
				echo "[files]"
				echo "#" 
				ls
				echo "#"
				echo -n "${ico} use_tools [file]${sig}"
				read fname
				hexedit $fname
			elif [ $use_tools == "show_s" ]
			then
				echo "[files]"
				echo "#" 
				ls
				echo "#"
				echo -n "${ico} use_tools [file]${sig}"
				read fname
				touch strings.txt
				strings $fname > strings.txt
				nano strings.txt
			elif [ $use_tools == "man" ]
			then
				nano readme.txt
			elif [ $use_tools == "c" ]
			then
				clear

			else 
				echo "not found"
			fi
		done
	
	elif [ $ef == "install_pakg" ]
	then
		echo -e "\n[installing required packages]\n"
		apt update
		apt install exiftool
		apt install binwalk
		apt install hexedit
		apt install binutils
		clear
	elif [ $ef == "q" ]
	then
		clear
		exit
			
	elif [ $ef == "c" ]
	then
		clear
	elif [ $ef == "man" ]
	then
		nano readme.txt
	else 
		echo "not found"
	fi

}

#mainloop
while true
do
	main_menu
done


