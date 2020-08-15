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
				
			elif [ $use_tools == "show_finf" ]
			then
				echo "[files]"
				echo "#" 
				ls
				echo "#"
				echo -n "${ico} use_tools [file]${sig}"
				read fname
				binwalk $fname
			elif [ $use_tools == "extract_finf" ]
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
			
			elif [ $use_tools == "hide_finf" ]
			then
				echo "[files]"
				echo "#" 
				ls
				echo "#"
			    echo -n "${ico} use_tools [host file]${sig}"
				read sname
				echo -n "${ico} use_tools [file to be hidden]${sig}"	
				read dname
				echo -n "${ico} use_tools [output file]${sig}"
				read oname
				cat $sname $dname > $oname
			elif [ $use_tools == "man" ]
			then
				echo -e "                              |Forensic tool manuals|      \n" >> man.txt
				echo "*  install_pakg: used for installing required packages   *" >> man.txt
				echo "*  use_tools   : used for using forensic tools           *" >> man.txt
				echo "	> show_exif     | display exif data    |           " >> man.txt
				echo "	> show_finf     | search hidden files  |           " >> man.txt
				echo "	> show_hex      | show hex of files    |			" >> man.txt
				echo "	> show_s        | show strings of files|			" >> man.txt
				echo "	> extract_finf  | extract hidden files |			" >> man.txt
				echo "	> hide_finf     | hides files in file  |            " >> man.txt
				echo "	> man           | show manuals         |			" >> man.txt
				echo "	> back          | go back to main menu |			" >> man.txt
				echo "	> c             | clear screen         |			" >> man.txt
				echo "*  c           : used for clearing screen                *" >> man.txt
				echo "*  q           : used to exit the programm               *" >> man.txt
				echo "*  man         : show manuals                            *" >> man.txt

				nano man.txt
				rm man.txt
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
		echo -e "                              |Forensic tool manuals|      \n" >> man.txt
		echo "*  install_pakg: used for installing required packages   *" >> man.txt
		echo "*  use_tools   : used for using forensic tools           *" >> man.txt
		echo "	> show_exif     | display exif data    |           " >> man.txt
		echo "	> show_f_in_f   | search hidden files  |           " >> man.txt
		echo "	> show_hex      | show hex of files    |			" >> man.txt
		echo "	> show_s        | show strings of files|			" >> man.txt
		echo "	> extract_f_in_f| extract hidden files |			" >> man.txt
		echo "	> man           | show manuals         |			" >> man.txt
		echo "	> back          | go back to main menu |			" >> man.txt
		echo "	> c             | clear screen         |			" >> man.txt
		echo "*  c           : used for clearing screen                *" >> man.txt
		echo "*  q           : used to exit the programm               *" >> man.txt
		echo "*  man         : show manuals                            *" >> man.txt

		nano man.txt
		rm man.txt
	else 
		echo "not found"
	fi

}

#mainloop
while true
do
	main_menu
done


