import os

def toktar_ide():
	print("[welcome to TOKTAR IDE]")
	print("[enter <help> command in <file name : > to see instruction and usage]\n")
	while True:
		f = input("file name : ")
		if f == "q":
			break
		elif f == "help":
			print("""
[ABOUT]
* TOKTAR IDE is a command line tool/ide for pythonier programmers and developers .
* AUTHOR Sachwlang Jamatia .
* DEVELOPED on 3rd september 2020 .
			
[USAGE COMMAND] :	
> file name : 
	< [file name] enter ur file name without .py extension >
	< [help] to see how to use these programm              >
	< [q] to quit                                          >
> run [y/n] ~~# 
	< [y] to run code  >
	< [n] to continue  >
	< [q] to quit      >

			""")
		else:
			fname = f + ".py"
			dmd = "subl " + fname
			wq = os.popen(dmd)
			run = "python " + fname
			a = input("run [y/n] ~~# ")
			if a == "y":
				ff = os.popen(run)
				dfg = ff.read()
				print(dfg)
			elif a == "n":
				continue
			elif a == "q":
				break
			else:
				print("invalid command")
	
toktar_ide()	