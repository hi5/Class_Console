/*
Name:			[Class] Console
Version:		1.9 forked (Mon August 18, 2014)
Created:		Tue February 11, 2014
Authors:		AfterLemon tidbit
GitHub:			https://github.com/AfterLemon/Class_Console
AutoHotkey:		http://www.autohotkey.com/board/topic/101881-class-console-standardized-console-gui-with-methods/
AHKScript:		http://ahkscript.org/boards/viewtopic.php?f=6&t=2116&p=14026

Functions Available:
Class_Console		to build the console object - use this in place of Console:=new console()
Desc_Console		to view the description of the class
Methods_Console		to view the documentation for the methods

Fork 1.9:
	Ensure variables and objects with HTML content is displayed as "RAW" html 
	because the contents of variables and texts is displayed in a HTML control
	html tag were invisible which was problematic for my personal use

Changes:
	- All CSS classes now have Console_DebugID_ prefix
	- Escape <> HTML tags to &lt; &gt; in variables & objects displayed by Log, Append, Prepend functions
	- Added color styling to Object display
	- Default name and position of size & size of Console
	
Tip:
	Add this to your AHK (main) script to allow ^e (or other hotkey) to set focus to cmdbar

	#IfWinActive Console DebugID ahk_class AutoHotkeyGUI
	^e::ControlFocus, Edit1, Console DebugID ahk_class AutoHotkeyGUI
	#IfWinActive

Quick usage:
	
	Class_Console() ; add default console to your script
	console.show()	; show defauft console
	console.log(var or Object) ; show content of Variable or Object

	type help + enter in the cmdbar for more info

*/


If(A_ScriptName="Class_Console.ahk")
{	Class_Console("Example",5,5,800,500),Example.Show()
	,Example.append("`n" Desc_Console(),1),Example.append("`n" Methods_Console(),1),Example.color("list"),Example.cmdwait("ipconfig")
	WinWaitClose,Console DebugID "Example"
	ExitApp
}

Class_Console(Name="Console",x=50,y=50,w=800,h=600,GuiTitle:="",Timestamp:=1,HTML:="",Font:="Courier New",FontSize:=10)
{	return new console(Name,x,y,w,h,GuiTitle,Timestamp,HTML,Font,FontSize)
}
Desc_Console()
{	static _,__,$,@
	ListLines,% ("Off",_:="<span class='Console_DebugID_c1'>",__:="<span class='Console_DebugID_c7'>",$:="</span>",@:="`n&nbsp;&nbsp;&nbsp;&nbsp;")
	ListLines,% ("On",T:="<span class='Console_DebugID_h2'>Description:" $ @ "A sort of debugging console for your script. Display variables, arrays, CSV and other delimited data, script info like Variables and Last Lines and more in a console-like Gui. You may also use the Command Bar to show info without needing to call stuff from the program. You may also do math or modify variables content.`n`n<span class='Console_DebugID_h1'>Notes:" $ @ "* """ _ "debugType" $ """ is the type of information using AutoHotkey's Built-in logs" @ "KeyHistory, ListVars (Vars),"
			.	" ListLines (Lines), and ListHotkeys (Hotkeys)`n" @ "* """ _ "Timestamp" $ """ should be 0, 1 or any """ __ "FormatTime" $ """ format." @ "0 = none. 1 = A_Now (default) otherwise format it according to the <a href=""http://autoscript.org/docs/commands/FormatTime.htm"">FormatTime docs</a>.`n" @ "* You may use <span class='Console_DebugID_c1'>CSS" $ " and some <span class='Console_DebugID_c4'>HTML" $ " to theme your console." @ "Default is high-contrast light-on-dark. <span class='Console_DebugID_c9'>Backgrounds can also be modified." $)
	return T
}
Methods_Console()
{	static _,__,___,____,$,@
	ListLines,% ("Off",_:="`n`n<span class='Console_DebugID_c4'>",__:="<span class='Console_DebugID_c5'>",___:="<span class='Console_DebugID_c1'>",____:="<span class='Console_DebugID_c2'>",$:="</span>",@:="`n&nbsp;&nbsp;&nbsp;&nbsp;")
	ListLines,% ("On",T:="<span class='Console_DebugID_h1'>Class:" $ @ __ "Class_Console" $ "(" ___ "Name,x,y,w,h" $ ____ " [,GuiTitle,Timestamp,HTML,Font,Fontsize]" $ ")`n" @ "This creates a new console object with the name of """ ___ "Name" $ """.`n`nAll the below stuff will use the console defined above.`nYou may use any name you like in your code.`n`n<span class='Console_DebugID_h1'>Methods:" $ _ "aaa" $ "." __ "append" $ "(" ____ "[text,delim,justify,pad,colsep]" $ ")" @ "Add text to the end of the console without a timestamp." _ "aaa" $ "." __
			.	"catch" $ "(" ____ "[line,var,value]" $ ")" @ "Detect when a variable is a certain value or a certain line of code is executed." _ "aaa" $ "." __ "clear" $ "()" @ "Remove all the text on the console." _ "aaa" $ "." __ "close" $ "()" @ "Close the console but don't destroy it. Basically you Hide it." _ "aaa" $ "." __ "color" $ "(" ____ "[c]" $ ")" @ "Sets text color for following lines. Default is white." @ "Specify ""list"" to see the color table." _ "aaa" $ "." __ "cmd" $ "(" ___ "command" $ ____ " [,breakOn,AppendConsole]"
			.	$ ")" @ "Run (and return) a command-prompt command and get the input line-by-line." _ "aaa" $ "." __ "cmdWait" $ "(" ___ "command" $ ____ " [,AppendConsole]" $ ")" @ "Run (and return) a command-prompt command and wait for it to fully finish." _ "aaa" $ "." __ "destroy" $ "()" @ "Destroy the console, it can not be shown until recreated." _ "aaa" $ "." __ "debug" $ "(" ___ "debugType" $ ")" @ "Show AHK's debug info: KeyHistory, ListVars (Vars), ListLines (Lines), and ListHotkeys (Hotkeys)." _ "aaa" $ "." __
			.	"eval" $ "(" ___ "In" $ ____ " [,Append]" $ ")" @ "Evaluate expression with numbers,+ # - / and *." _ "aaa" $ "." __ "log" $ "(" ____ "[text,delim,justify,pad,colsep]" $ ")" @ "Same as append, but with a timestamp." _ "aaa" $ "." __ "prepend" $ "(" ____ "[text,delim,justify,pad,colsep]" $ ")" @ "Same as append, but adds the text to the TOP (line 1) of the console." _ "aaa" $ "." __ "pull" $ "()" @ "Get the current console text." _ "aaa" $ "." __ "save" $ "(" ____ "[FileName,Overwrite (flag)]" $ ")" @ "Save the "
			.	"console to a file." _ "aaa" $ "." __ "show" $ "()" @ "Show a closed or recently created console." _ "aaa" $ "." __ "timeSinceLastCall" $ "(" ____ "[id,reset]" $ ")" @ "Get the amount of time (in MS) since the last time this function was called." _ "aaa" $ "." __ "update" $ "(" ___ "debugType" $ ")" @ "This is similar to doing a CLEAR and then LOG(DEBUG()).")
	return T
}
class console
{	__new(ObjVar,x,y,w,h,GuiTitle:="",Timestamp:=1,HTML:="",Font:="Courier New",FontSize:=10)
	{	global
		static _,__,$,@,@@
		local Name2,MatchList,Check,Temp_,Temp_2,Gui,Gui_B,cmd,cmd2,Assign1,Assign2,Assign3,debugprev,DHW,textO,Check2,tc,Console_Help1,Console_Help2,Console_Help3
		ListLines,% ("Off",this.Time:=A_Now,this.WordList:=this.WordList1 this.WordList2,((Timestamp!=0&&Timestamp!=1)?this.timeext:=Timestamp:(Timestamp=1?this.timeext:="":(Timestamp=0?this.timeext:=0:""))),Name2:=(GuiTitle?GuiTitle:"DebugID """ ObjVar """"),this.Name:=ObjVar,this.edit:=ObjVar this.time,this.tc:="Console_DebugID_c3",this.history:=[],%ObjVar%:=this,_:="<span class='Console_DebugID_c1'>",__:="<span class='",$:="</span>",@:="&nbsp;",@@:=@ @ @ @)
		SetFormat,FloatFast,0.18
		If !html
			html=
			(ltrim
			<!DOCTYPE html>
			<html>
			<head>
			<style type="text/css">
			#Console_DebugID_bod {background-color:black;color:white;font:%FontSize%pt %Font%;}
			p {margin:0;padding:0;}
			.Console_DebugID_c1{color:yellow;}.c2{color:orange;}.Console_DebugID_c3{color:white;}.Console_DebugID_c4{color:red;}.Console_DebugID_c5{color:cyan;}.Console_DebugID_c6{color:lime;}.Console_DebugID_c7{color:green;}.Console_DebugID_c8{color:#999999;}.Console_DebugID_c9{color:black;background-color:#DDDDDD}
			.Console_DebugID_h1{color:yellow;font-size:14pt;}.Console_DebugID_h2{color:orange;font-size:14pt;}.Console_DebugID_h3{color:white;font-size:14pt;}.Console_DebugID_h4{color:red;font-size:14pt;}.Console_DebugID_h5{color:cyan;font-size:14pt;}.Console_DebugID_h6{color:lime;font-size:14pt;}.Console_DebugID_h7{color:green;font-size:14pt;}.Console_DebugID_h8{color:#999999;font-size:14pt;}.Console_DebugID_h9{color:black;background-color:#DDDDDD;font-size:14pt;}.Console_DebugID_h10{font-size:18pt;}
			.Console_DebugID_s1{color:#BBBBBB;font-size:8pt;}
			.Console_DebugID_dlim1{color:#444444;}
			.Console_DebugID_num{color:#6666FF;}
			.Console_DebugID_array{color:#fc0;font-weight:bold;}
			em {color:cyan;}
			</style>
			</head>
			<body id="Console_DebugID_bod">
			)
		Gui,% ObjVar ":Destroy"
		Gui,% ObjVar ":Font",s%FontSize% cDDDDDD,%Font%
		Gui,% ObjVar ":color",000000,000000
		Gui,% ObjVar ":add",activeX,% "x0 y-1 w" w " h" h-22 " -TabStop HScroll v" this.edit, MSHTML:
		Gui,% ObjVar ":add",edit,% "x-1 y" h-23 " w" w+2 "h22 -0x200 vcc" ObjVar
		Gui,% ObjVar ":add",button,default Hidden gSubCC,OK
		Gui,% (ObjVar ":-MinimizeBox +Border",this.Check2:=["",@ @,@ @ @,@@,@@ @])
		Gui,% ObjVar ":show",% "Hide x" x " y" y " w" (this.w:=w) " h" h,% ("Console " Name2,this.fontsize:=FontSize,this.line:=0,Temp_:=this.edit)
		Console_Help1:={"!ExitApp": __ "Console_DebugID_c6'>Desc:" $ @ @ @ " Exits entire script.`n" __ "Console_DebugID_c5'>Syntax:" $ @ " ExitApp"
			,"*Catch":__ "Console_DebugID_c6'>Desc:" $ @ @ @ " Detect when a variable is a certain value,`n" __ "Console_DebugID_c6'>OR" $ @@ @ @ " Detect when a line in ListLines exists.`n" __ "Console_DebugID_c5'>Syntax:" $ @ " catch var varName Value command`n" __ "Console_DebugID_c5'>Syntax:" $ @ " catch var line DebugLineNum Command`n" __ "Console_DebugID_c1'>Example:" $ " catch var d 4 prepend %d%`n" __ "Console_DebugID_c1'>Example:" $ " catch line 11 log line 11 was accessed!"
			,"*Settimer":__ "Console_DebugID_c6'>Desc:" $ @ @ @ " Run a [command] every N milliseconds (1000=1 second, 5000=5 seconds, etc).`n" __ "Console_DebugID_c5'>Syntax:" $ @ " SetTimer N command`n" __ "Console_DebugID_c1'>Example:" $ " SetTimer 1000 var Banana"
			,"?About":__ "Console_DebugID_c6'>Desc:" $ @ @ @ " Show information about this Console and its Creators.`n" __ "Console_DebugID_c5'>Syntax:" $ @ " About"
			,Append:__ "Console_DebugID_c6'>Desc:" $ @ @ @ " Add text to the end of the console.`n" @@ @@ @ __ "Console_DebugID_s1'>You may use variables such as %varName%." $ "`n" __ "Console_DebugID_c5'>Syntax:" $ @ " Append Text`n" __ "Console_DebugID_c1'>Example:" $ " Append I'm at the end of the log! For now..."
			,Clear:__ "Console_DebugID_c6'>Desc:" $ @ @ @ " Clear all text in the console.`n" __ "Console_DebugID_c5'>Syntax:" $ @ " Clear"
			,Close:__ "Console_DebugID_c6'>Desc:" $ @ @ @ " Close (or hide) the console. It can be re-shown.`n" __ "Console_DebugID_c5'>Syntax:" $ @ " Close"
			,Color:__ "Console_DebugID_c6'>Desc:" $ @ @ @ " Apply a color [N] to all below lines.`n" @@ @@ @ __ "Console_DebugID_s1'>Available colors: " __ "Console_DebugID_c1'>Yellow" $ ", " __ "Console_DebugID_c2'>Orange" $ ", " __ "Console_DebugID_c3'>White" $ ", " __ "Console_DebugID_c4'>Red" $ ", " __ "Console_DebugID_c5'>Blue" $ ", " __ "Console_DebugID_c6'>Lime" $ ", " __ "Console_DebugID_c7'>Green" $ ", " __ "Console_DebugID_c8'>Gray" $ ", " __ "Console_DebugID_c9'>Black" $ "." $ "`n" @@ @@ @ __ "Console_DebugID_s1'>Or type 'color list' for a visual list of all the colors." $ "`n" __ "Console_DebugID_c5'>Syntax:" $ @ " Color N|List`n" __ "Console_DebugID_c1'>Example:" $ " color " __ "Console_DebugID_c5'>blue" $ "`n" __ "Console_DebugID_c1'>Example:" $ " color list"
			,Cmd:__ "Console_DebugID_c6'>Desc:" $ @ @ @ " Run cmd.exe commands here. You can ping, run programs, whatever you want. Output will go to the console. This gets stuff line-by-line.`n" __ "Console_DebugID_c5'>Syntax:" $ @ " cmd cmd.exe stuff`n" __ "Console_DebugID_c1'>Example:" $ " Cmd ipconfig"
			,CmdWait:__ "Console_DebugID_c6'>Desc:" $ @ @ @ " Run cmd.exe commands here. You can ping, run programs, whatever you want. Output will go to the console. This waits for the whole command to finish before printing to the console.`n" __ "Console_DebugID_c5'>Syntax:" $ @ " CmdWait cmd.exe stuff`n" __ "Console_DebugID_c1'>Example:" $ " CmdWait ipconfig"}
		Console_Help2:={Debug:__ "Console_DebugID_c6'>Desc:" $ @ @ @ " Get various AHK debugging info such as Last Lines.`n" @@ @@ @ "UNIT should be one of the following: Hotkeys, KeyHistory, Lines or Vars`n" __ "Console_DebugID_c5'>Syntax:" $ @ " debug UNIT`n" __ "Console_DebugID_c1'>Example:" $ " Debug Vars"
			,Destroy:__ "Console_DebugID_c6'>Desc:" $ @ @ @ " Destroy the console. It can NOT be re-shown.`n" __ "Console_DebugID_c5'>Syntax:" $ @ " Destroy`n" __ "Console_DebugID_c1'>Example:" $ " Destroy"
			,Log:__ "Console_DebugID_c6'>Desc:" $ @ @ @ " Add text to the end of the console with a formatted timestamp above the new text.`n" @@ @@ @ __ "Console_DebugID_s1'>You may use variables such as %varName%." $ "`n" __ "Console_DebugID_c5'>Syntax:" $ @ " Log Text`n" __ "Console_DebugID_c1'>Example:" $ " Log Some new data"
			,Operators:__ "Console_DebugID_c6'>Desc:" $ @ @ @ " Create and/or do math or do other unforsaken things to variables, such as append text. You do not need to use quotes around text.`nAvailable Operators: := .= += -= *= /= //= &= ^= |=`n" __ "Console_DebugID_c5'>Syntax:" $ @ " var+=5`n" __ "Console_DebugID_c1'>Example:" $ " SomeVar.=New text at the end."
			,Prepend:__ "Console_DebugID_c6'>Desc:" $ @ @ @ " Adds text to the TOP of the console, not the bottom.`n" @@ @@ @ __ "Console_DebugID_s1'>You may use variables such as %varName%." $ "`n" __ "Console_DebugID_c5'>Syntax:" $ @ " Prepend Text`n" __ "Console_DebugID_c1'>Example:" $ " Prepend I'M ON TOP OF THE WOR... CONSOLE!"
			,Pull:__ "Console_DebugID_c6'>Desc:" $ @ @ @ " Pulls data from console window (line/lines specifies the line numbers) and saves it in a variable (or the clipboard).`n" __ "Console_DebugID_c5'>Syntax:" $ @ " Pull [lines|line First-Last|N] VarName|Clipboard`n" __ "Console_DebugID_c1'>Example:" $ " Pull banana`n" __ "Console_DebugID_c1'>OR" $ @@ @ @ @ "Pull lines 1-10 banana`n" __ "Console_DebugID_c1'>OR" $ @@ @ @ @ "Pull line 3 banana"
			,Run:__ "Console_DebugID_c6'>Desc:" $ @ @ @ " Runs a label within the script.`n" __ "Console_DebugID_c5'>Syntax:" $ @ " Run Label`n" __ "Console_DebugID_c1'>Example:" $ " Run BananaLabel -> BananaLabel: ...."
			,Save:__ "Console_DebugID_c6'>Desc:" $ @ @ @ " Save the console text to the specified file.`n" __ "Console_DebugID_c5'>Syntax:" $ @ " Save Filepath`n" __ "Console_DebugID_c1'>Example:" $ " Save C:\blah\log.txt"
			,Show:__ "Console_DebugID_c6'>Desc:" $ @ @ @ " Show a specified closed (not destroyed) console or reshow the current one.`n" __ "Console_DebugID_c5'>Syntax:" $ @ " Show NAME`n" __ "Console_DebugID_c1'>Example:" $ " Show Variable"
			,TimeSinceLastCall:__ "Console_DebugID_c6'>Desc:" $ @ @ @ " ID and Reset are optional. Appends time in milliseconds since the last time this command was run.`n" __ "Console_DebugID_c5'>Syntax:" $ @ " TimeSinceLastCall ID Reset`n" __ "Console_DebugID_c1'>Example:" $ " TimeSinceLastCall 1"
			,Update:__ "Console_DebugID_c6'>Desc:" $ @ @ @ " Uses last Debug UNIT, clearing the log and re-running the debug.`n" __ "Console_DebugID_c5'>Syntax:" $ @ " Update`n" __ "Console_DebugID_c1'>Example:" $ " Debug vars --> SetTimer 3000 Update"
			,Var:__ "Console_DebugID_c6'>Desc:" $ @ @ @ " Print the value of a variable to the console. no %'s needed.`n" @@ @@ @ "-1 = Prepend, 1 = Log. Default is Append.`n" __ "Console_DebugID_c5'>Syntax:" $ @ " Var VariableName (-1,0,1)`n" __ "Console_DebugID_c1'>Example:" $ " Var Banana"}
		For Assign1,Assign2 in (Console_Help1,this.Console_Help:={})
			this.Console_Help[Assign1]:=Assign2
		For Assign1,Assign2 in Console_Help2
			this.Console_Help[Assign1]:=Assign2
		DetectHiddenWindows,% ("On",DHW:=A_DetectHiddenWindows)
		DetectHiddenWindows,% (DHW,this.HWND:=WinExist("Console " Name2),%Temp_%.write(this.html:=html),this.append(__ "Console_DebugID_s1'>Type 'help' for a list of commands (no quotes)" $))
		ListLines,On
		return 1
		TimerSubCC:
		SubCC:
			ListLines,Off
			If(A_ThisLabel!="TimerSubCC")
			{	Gui,% A_Gui ":Submit",NoHide
				GuiControl,,% ("cc" A_Gui,Gui:=%A_Gui%.Name)
			}else cc%Gui%:=cc%Gui%_B,Gui:=Gui_B
			For Temp_ in ((InStr(cc%Gui%," ")?cmd:=StrSplit(cc%Gui%,[" ","`t"]):(cmd:=[],cmd[1]:=(InStr(cc%Gui%,",")?SubStr(cc%Gui%,1,InStr(cc%Gui%,",")-1):cc%Gui%))),cmd2:=StrSplit((InStr(cc%Gui%," ")?SubStr(cc%Gui%,InStr(cc%Gui%," ")+1):cc%Gui%),","))
				(cmd[Temp_]=""?cmd.remove(Temp_):"")
			If(RegExReplace(cc%Gui%,".=")!=cc%Gui%,%Gui%.cls:=%Gui%.clear,%Gui%.exit:=%Gui%.destroy)
			{	Transform,Assign3,deref,% SubStr(cc%Gui%,InStr(cc%Gui%,"=")+1)
				Assign1:=SubStr(cc%Gui%,1,InStr(cc%Gui%,"=")-2),Assign2:=SubStr(cc%Gui%,InStr(cc%Gui%,"=")-1,2),%Assign1%:=%Gui%.eval((Assign2=":="?Assign3:(Assign2="+="?%Assign1%+Assign3:(Assign2="-="?%Assign1%-Assign3:(Assign2="*="?%Assign1%*Assign3:(Assign2="/="?%Assign1%/Assign3:(Assign2="//="?%Assign1%//Assign3:(Assign2=".="?%Assign1% Assign3:(Assign2="|="?%Assign1%|Assign3:(Assign2="&="?%Assign1%&Assign3:(Assign2="^="?%Assign1%^Assign3:"")))))))))))
			}else If(cmd[1]="settimer")
			{	Transform,Temp_,deref,% cmd[2]
				Loop,% (cmd.MaxIndex()-2,cc%Gui%_B:="",Gui_B:=Gui)
					cc%Gui%_B.=cmd[A_Index+2] " "
				SetTimer,% ("TimerSubCC",cc%Gui%_B:=RTrim(cc%Gui%_B," ")),%Temp_%
			}else If(cmd[1]="var")
				Temp_:=cmd[2],%Gui%[(cmd[3]=1?"log":(cmd[3]="-1"?"prepend":"append"))](%Temp_%)
			else If(cmd[1]="about")
				%Gui%.append(__ "Console_DebugID_c2'>Name:" $ @@ @@ __ "Console_DebugID_c5'>[Class] Console`n" $ __ "Console_DebugID_c2'>Version:" $ @@ @ __ "Console_DebugID_c6'>1.8 " $ __ "Console_DebugID_c1'>(Tue March 11, 2014)`n" __ "Console_DebugID_c2'>Created:" $ @@ @ __ "Console_DebugID_c1'>Tue February 11, 2014`n" $ __ "Console_DebugID_c2'>Authors:" $ @@ @ __ "Console_DebugID_c4'>AfterLemon tidbit`n" $ __ "Console_DebugID_c2'>GitHub:" $ @@ @ @ "<a href=""https://github.com/AfterLemon/Class_Console"">Class_Console on GitHub</a>"
								.	"`n" __ "Console_DebugID_c2'>AutoHotkey:" $ @ @ "<a href=""http://ahkscript.org/boards/viewtopic.php?f=6&t=2116"">Class_Console on AutoHotkey</a>`n" __ "Console_DebugID_c2'>AHKScript:" $ @ @ @ "<a href=""http://ahkscript.org/boards/viewtopic.php?f=6&t=2116&p=14026"">Class_Console on AHKScript</a>" $,1)
			else If(cmd[1]="catch")
				(cmd[2]="line"?%Gui%.catch(cmd[3]):(cmd[2]="var"?%Gui%.catch("",cmd[3],cmd[4]):""))
			else If(cmd[1]="cmd")
				%Gui%.cmd((cmd2[1]?cmd2[1]:""),(cmd2[2]?cmd2[2]:""),(cmd2[3]?cmd2[3]:1))
			else If(cmd[1]="cmdwait")
				%Gui%.cmdwait((cmd2[1]?cmd2[1]:""),(cmd2[2]?cmd2[2]:1))
			else If(cmd[1]="debug")
				%Gui%.log(%Gui%.debug(cmd[2]))
			else If(cmd[1]="desc")
				%Gui%.append(Desc_Console())
			else If(cmd[1]="exitapp")
				ExitApp
			else If(cmd[1]="help")
			{	If (cmd[2]=""||cmd[2]="All")
				{	For Temp_,Check in %Gui%.Console_Help
						Assign2:=SubStr(Temp_,1,1),Assign1.="`n" __ (Assign2="!"?"Console_DebugID_h4":(Assign2="*"?"Console_DebugID_h2":(Assign2="?"?"Console_DebugID_h7":"Console_DebugID_h8"))) "'>[" Temp_ "]" $ "<br/>`n" @@ RegExReplace(Check,"`n","`n" @@)
					%Gui%.append(__ "Console_DebugID_h10'>ConsoleBar_Commands" $ Assign1 "<br/>`n----------------")
				}else
				{	If Temp_:=%Gui%.Console_Help[Temp_2:=(cmd[2]="ExitApp"?"!ExitApp":(cmd[2]~="Catch|SetTimer"?"*" cmd[2]:(cmd[2]="About"?"?About":cmd[2])))]
						Assign2:=SubStr(Temp_2,1,1),%Gui%.append(__ (Assign2="!"?"Console_DebugID_h4":(Assign2="*"?"Console_DebugID_h2":(Assign2="?"?"Console_DebugID_h7":"Console_DebugID_h8"))) "'>[" Temp_2 "]" $ "<br/>`n" @@ RegExReplace(Temp_,"`n","`n" @@))
					else Msgbox,% "Help """ cmd[2] """ does not exist. Type 'help' for a list."
			}}else If(cmd[1]="methods")
				%Gui%.append(Methods_Console(),1)
			else If(cmd[1]="pull")
			{	If(cmd[2]="lines"||cmd[2]="line")
				{	Loop,parse,Temp_,`n,% ("`r",Temp_:=%Gui%.pull(),Check:=SubStr(cmd[3],InStr(cmd[3],"-")+1))
					{	If !(A_LoopField=""||A_Index<Assign1:=SubStr(cmd[3],1,(cmd[2]="line"?StrLen(cmd[3]):InStr(cmd[3],"-")-1)))
						{	If((A_Index>(cmd[2]="line"?Assign1:Check))||(Check="End"||Check="Last"))
								break
							If(cmd[4]="clipboard",(A_Index=Assign1?Clipboard:="":""))
								ClipWait,% ("",Clipboard.=(cmd[2]="line"?"":"`n") A_LoopField)
							else Temp_:=cmd[4],%Temp_%.=(cmd[2]="line"?"":"`n") A_LoopField
				}}}else If(cmd[2]="clipboard")
					ClipWait,% ("",Clipboard:=%Gui%.pull())
				else Temp_:=cmd[2],%Temp_%:=%Gui%.pull()
			}else If(cmd[1]="save")
				%Gui%.save((cmd2[2]?cmd2[2]:(cmd[2]?cmd[2]:A_ScriptDir "\AutoHotkey Console Debug.txt")),(cmd2[3]?cmd2[3]:""),(cmd2[4]?cmd2[4]:0))
			else If(cmd[1]="timesincelastcall")
				%Gui%.timesincelastcall((cmd2[1]?cmd2[1]:1),(cmd2[2]?cmd2[2]:""))
			else If(cmd[1]~="append|log|prepend")
			{	Transform,Temp_,deref,% (InStr(cmd2[1]," ")?cmd2[1]:(cmd[2]?cmd[2]:(cmd2[2],cmd2[2]:=cmd2[3],cmd2[3]:=cmd2[4],cmd2[4]:=cmd2[5],cmd2[5]:=cmd2[6],cmd2[6]:=cmd2[7])))
				%Gui%[cmd[1]]((Temp_?Temp_:""),(cmd2[2]?cmd2[2]:(cmd[1]="prepend"?1:0)),(cmd2[3]?cmd2[3]:""),(cmd2[4]?cmd2[4]:1),(cmd2[5]?cmd2[5]:" "),(cmd2[6]?cmd2[6]:" | "))
			}else If(cmd[1]~="color|run|update|show")
				%Gui%[cmd[1]]((cmd[2]?cmd[2]:""))
			else If(cmd[1]~="clear|cls|close|destroy|exit")
				%Gui%[cmd[1]]()
			ListLines,On
		return
	}
	__delete()
	{	ListLines,Off
		Gui,% this.Name ": destroy"
		ListLines,On
	}

	append(text:="",scroll:=0,delim:="",justify:=1,pad:=" ",colsep:=" | ")
	{	ListLines,Off
		(IsObject(text)?text:=RegExReplace(st_PrintArr(text,,"")," ","&nbsp;"):(delim!=""?text:=RegExReplace(AL_Columnize(text,delim,justify,pad,colsep)," ","&nbsp;"):"")),(text?"":text:="&nbsp;")
		Loop,parse,text,`n
			{
			 if !RegExMatch(A_LoopField,"class='Console_DebugID_")
			 	{
			 	 StringReplace, textAppend, A_LoopField, <,&lt;, All
				 StringReplace, textAppend, textAppend, >,&gt;, All
				 StringReplace, textAppend, textAppend, &lt;span&nbsp;class=Console_DebugID_array&gt;[&lt;/span&gt;&lt;em&gt;,<span class=Console_DebugID_array>[</span><em>, All
				 StringReplace, textAppend, textAppend, &lt;/em&gt;&lt;span&nbsp;class=Console_DebugID_array&gt;]&lt;/span&gt;,</em><span class=Console_DebugID_array>]</span>, All
				}
			 Else
			 	textAppend:=A_LoopField	 
			 textO.=(A_Index=1?"":"</p>") "<p class='Console_DebugID_" this.tc "'><span class='Console_DebugID_num'>" ++this.line ".</span>" this.Check2[(this.line<10?5:(this.line<100?4:(this.line<1000?3:2)))] textAppend
			}
		ListLines,% ("On",Temp_:=this.edit,%Temp_%.write(((text~="^\s+$"||text="")?textO:Trim(textO,"`r`n `t")) "</p>"),%Temp_%.getElementById("Console_DebugID_bod").scrollIntoView(scroll))
	}

	catch(line:="",var:="",value:="")
	{	global catchTemp,catchConsole,catchLine,catchVar,catchValue,catchCaught
		ListLines,Off
		If(line&&var)
			return
		else If line
			catchTemp:=this.debug("lines")
		SetTimer,% ("Console_Catch",catchConsole:=this.name,catchLine:=line,catchVar:=var,catchValue:=value),20
		return
		Console_Catch:
			ListLines,Off
			If(catchTemp=""&&%catchVar%=catchValue)
				catchCaught:=1
			else
			{	StringReplace,catchTemp,catchTemp,`n,`n,UseErrorLevel
				ListLines,% ("Off",Assign1:=ErrorLevel-50,Temp_2:=%catchConsole%.debug("lines"))
				Loop,parse,Temp_2,`n
				{	If(A_Index>=Assign1)
					{	If(SubStr(A_LoopField,1,4)=(StrLen(catchLine)<2?00 catchLine:(StrLen(catchLine)<3?0 catchLine:catchLine)) ":")
						{	catchCaught:=1
							break
			}}}}If catchCaught
				SetTimer,% ("Console_Catch",(catchTemp?%catchConsole%.append("Line " catchLine " executed!"):%catchConsole%.append("Var " catchVar " = " catchValue "."))),Off
		ListLines,On
		return
	}

	clear()
	{	ListLines,% ("Off",Temp_:=this.edit,this.line:=0,%Temp_%.close(""),%Temp_%.write(this.html))
	}

	close()
	{	ListLines,Off
		Gui,% this.Name ": cancel"
		ListLines,On
	}

	cmd(cmd:="",breakOn:="",AppendConsole:=1)
	{	ListLines,% ("Off",DllCall("RegisterShellHookWindow",UInt,A_ScriptHwnd),MsgNum:=DllCall("RegisterWindowMessage",Str,"SHELLHOOK"),OnMessage(MsgNum,"ShellMessage"),(cmd!=""?(this.objShell:=ComObjCreate("WScript.Shell"),this.cmd:=cmd):cmd:=this.cmd),objExec:=this.objShell.Exec(cmd),Temp_:=objExec.StdOut.AtEndOfStream)
		While !Temp_
		{	If((InStr(data,breakOn)&&breakOn!=""),(AppendConsole?this.append(data:=objExec.StdOut.ReadLine()):""),all.=data "`n")
				return (data,OnMessage(MsgNum,""))
			ListLines,% ("Off",Temp_:=objExec.StdOut.AtEndOfStream)
		}return (trim(all,"`r`n"),OnMessage(MsgNum,""))
	}

	cmdWait(cmd:="",AppendConsole:=1)
	{	ListLines,% ("Off",DllCall("RegisterShellHookWindow",UInt,A_ScriptHwnd),MsgNum:=DllCall("RegisterWindowMessage",Str,"SHELLHOOK"),OnMessage(MsgNum,"ShellMessage"),(cmd!=""?(this.objShell:=ComObjCreate("WScript.Shell"),this.cmd:=cmd):cmd:=this.cmd),objExec:=this.objShell.Exec(cmd),Temp_:=objExec.Status)
		While !Temp_
			ListLines,% ("Off",Temp_:=objExec.Status,DllCall("Sleep",uint,50))
		return (data,OnMessage(MsgNum,""),(AppendConsole?this.append(data:=objExec.StdOut.ReadAll()):""))
	}

	color(color:="white") ; these colors are the same as what is defined in the CSS in __new().
	{	static yellow,orange,white,red,blue,lime,green,black,_,$,h,f
		ListLines,% ("Off",yellow:="Console_DebugID_c1",orange:="Console_DebugID_c2",white:="Console_DebugID_c3",red:="Console_DebugID_c4",blue:="Console_DebugID_c5",lime:="Console_DebugID_c6",green:="Console_DebugID_c7",black:="Console_DebugID_c8",_:="&nbsp;",$:="|`n|",h:="`n<span class='Console_DebugID_h1'>Color Table</span>`n.-----------------.",f:="'-----------------'")
		ListLines,% ("On",(color="list"?this.append(h "`n|" _ "yellow" _ "|" _ "<span class='Console_DebugID_c1'>yellow</span>" _ $ _ "orange" _ "|" _ "<span class='Console_DebugID_c2'>orange</span>" _ $ _ "white" _ _ "|" _ "<span class='Console_DebugID_c3'>white</span>" _ _ "|" _ "<span class='Console_DebugID_s1'><-" _ "default</span>`n|" _ "red" _ _ _ _ "|" _ "<span class='Console_DebugID_c4'>red</span>" _ _ _ _ $ _ "blue" _ _ _ "|" _ "<span class='Console_DebugID_c5'>cyan</span>" _ _ _ $ _ "lime" _ _ _ "|" _ "<span class='Console_DebugID_c6'>lime</span>" _ _ _ $ _ "green" _ _ "|" _ "<span class='Console_DebugID_c7'>green</span>" _ _ $ _ "gray" _ _ _ "|" _  "<span class='Console_DebugID_c8'>gray</span>" _ _ _ $ _ "black" _ _ "|" _ "<span class='Console_DebugID_c9'>black</span>" _ _ "|`n" f):this.tc:=%color%))
	}

	debug(debugType) ; Credit @ Lexikos -> http://www.autohotkey.com/board/topic/20925-listvars/#entry156570
	{	static id,pSFW,pSW,bkpSFW,bkpSW
		ListLines,Off
		If !id
		{	DetectHiddenWindows,% ("On",d:=A_DetectHiddenWindows)
			Process,Exist
			ControlGet,id,Hwnd,,Edit1,ahk_class AutoHotkey ahk_pid %ErrorLevel%
			DetectHiddenWindows,% (d,astr:=(A_IsUnicode?"astr":"str"),ptr=(A_PtrSize=8?"ptr":"uint"),hmod=DllCall("GetModuleHandle",str,"user32.dll"),pSFW=DllCall("GetProcAddress",ptr,hmod,astr,"SetForegroundWindow"),pSW=DllCall("GetProcAddress",ptr,hmod,astr,"ShowWindow"),DllCall("VirtualProtect",ptr,pSFW,ptr,8,uint,0x40,"uint*",0),DllCall("VirtualProtect",ptr,pSW,ptr,8,uint,0x40,"uint*",0),bkpSFW=NumGet(pSFW+0,0,"int64"),bkpSW=NumGet(pSW+0,0,"int64"))
		}(A_PtrSize=8?(NumPut(0x0000C300000001B8,pSFW+0,0,"int64"),NumPut(0x0000C300000001B8,pSW+0,0,"int64")):(NumPut(0x0004C200000001B8,pSFW+0,0,"int64"),NumPut(0x0008C200000001B8,pSW+0,0,"int64")))
		IfEqual,debugType,Vars,ListVars
		else IfEqual,debugType,Lines,ListLines
		else IfEqual,debugType,Hotkeys,ListHotkeys
		else IfEqual,debugType,KeyHistory,KeyHistory
		ControlGetText,O,,% ("ahk_id " id,NumPut(bkpSFW,pSFW+0,0,"int64"),NumPut(bkpSW,pSW+0,0,"int64"),debugprev:=debugType)
		ListLines,On
		return O
	}

	destroy()
	{	ListLines,Off
		Gui,% this.Name ": destroy"
		ListLines,On
	}

	eval(In,Append:=0)
	{	ListLines,Off
		ListLines,% ("On",Out:=(RegExMatch(In:=RegExReplace(In,"-","#"),"(.*)\(([^\(\)]+)\)(.*)",y)?this.eval(y1 Eval#(y2) y3):Eval#(In)))
		return (Append?this.append(Out):Out)
	}

	log(text:="",scroll:=0,delim:="",justify:=1,pad:=" ",colsep:=" | ")
	{	ListLines,Off
		FormatTime,time,T0,% (this.timeext,(IsObject(text)?text:=st_PrintArr(text,,""):(delim!=""?text:=AL_Columnize(text,delim,justify,pad,colsep):"")))
		Loop,parse,text,`n,% ("",Log:="<p><span class='Console_DebugID_num'>" ++this.line ".</span>" this.Check2[(this.line<10?5:(this.line<100?4:(this.line<1000?3:2)))] "<span class='Console_DebugID_c1'>" (time?"&nbsp;&nbsp;&nbsp;" time "</span>":"</span>"))
			{
			if !RegExMatch(A_LoopField,"class='Console_DebugID_")
			 	{
			 	 StringReplace, textAppend, A_LoopField, <,&lt;, All
				 StringReplace, textAppend, textAppend, >,&gt;, All
				 StringReplace, textAppend, textAppend, &lt;span class=Console_DebugID_array&gt;[&lt;/span&gt;&lt;em&gt;,<span class=Console_DebugID_array>[</span><em>, All
				 StringReplace, textAppend, textAppend, &lt;/em&gt;&lt;span class=Console_DebugID_array&gt;]&lt;/span&gt;,</em><span class=Console_DebugID_array>]</span>, All
				}
			 Else
			 	textAppend:=A_LoopField	 
			textO.="<p class='Console_DebugID_" this.tc "'><span class='Console_DebugID_num'>" ++this.line ".</span>" this.Check2[(this.line<10?5:(this.line<100?4:(this.line<1000?3:2)))] textAppend
			}
		Temp_:=this.edit,%Temp_%.write(log textO),%Temp_%.getElementById("Console_DebugID_bod").scrollIntoView(scroll)
		ListLines,On
	}

	prepend(text:="",scroll:=1,delim:="",justify:=1,pad:=" ",colsep:=" | ")
	{	ListLines,Off
		ListLines,% ("Off",(IsObject(text)?text:=st_PrintArr(text,,""):(delim!=""?text:=AL_Columnize(text,delim,justify,pad,colsep):"")),Temp_:=this.edit,data:=%Temp_%.getElementById("Console_DebugID_bod").innerHTML,this.clear())
		Loop,parse,text,`n
			{	
			 if !RegExMatch(A_LoopField,"class='Console_DebugID_")
			 	{
			 	 StringReplace, textAppend, A_LoopField, <,&lt;, All
				 StringReplace, textAppend, textAppend, >,&gt;, All
				 StringReplace, textAppend, textAppend, &lt;span class=Console_DebugID_array&gt;[&lt;/span&gt;&lt;em&gt;,<span class=Console_DebugID_array>[</span><em>, All
				 StringReplace, textAppend, textAppend, &lt;/em&gt;&lt;span class=Console_DebugID_array&gt;]&lt;/span&gt;,</em><span class=Console_DebugID_array>]</span>, All
				}
			 Else
			 	textAppend:=A_LoopField
			textO.="<p class='Console_DebugID_" this.tc "'><span class='Console_DebugID_num'>" ++this.line ".</span>" this.Check2[(this.line<10?5:(this.line<100?4:(this.line<1000?3:2)))] textAppend
		}Loop,parse,data,`n,% ("",Assign2:=this.line)
			Assign3:=SubStr(A_LoopField,1,InStr(A_LoopField,".")-1),this.line++,Assign1:=RegExReplace(SubStr(A_LoopField,InStr(A_LoopField,".")+1),"(" (SubStr(Assign3,InStr(Assign3,">",0,0)+1)<10?"&nbsp;&nbsp;&nbsp;":(SubStr(Assign3,InStr(Assign3,">",0,0)+1)<100?"&nbsp;&nbsp;":(SubStr(Assign3,InStr(Assign3,">",0,0)+1)<1000?"&nbsp;":""))) "&nbsp;&nbsp;)(.*)","$2"),textO.=SubStr(Assign3,1,InStr(Assign3,">",0,0)) SubStr(Assign3,InStr(Assign3,">",0,0)+1)+Assign2 "." this.Check2[(this.line<10?5:(this.line<100?4:(this.line<1000?3:2)))] Assign1
		ListLines,% ("On",%Temp_%.write(textO),%Temp_%.getElementById("Console_DebugID_bod").scrollIntoView(scroll))
	}

	pull()
	{	ListLines,Off
		ListLines,% ("On",Temp_:=this.edit,Data:=%Temp_%.getElementById("Console_DebugID_bod").innerText)
		return Data
	}

	run(Label)
	{	GOSUB,%Label%
	}

	save(FileName:="%A_ScriptDir%\AutoHotkey Console Debug.txt",HTML:="",Overwrite:=0)
	{	ListLines,Off
		Transform,FileName,deref,%FileName%
		If(Overwrite,Temp_:=this.edit,Data:=(HTML?%Temp_%.getElementById("Console_DebugID_bod").innerHTML:%Temp_%.getElementById("Console_DebugID_bod").innerText))
			FileDelete,%FileName%
		FileAppend,%Data%,%FileName%
		ListLines,On
	}

	show(GuiName:="")
	{	ListLines,Off
		Gui,% (GuiName?GuiName:this.name) ":Show"
		ListLines,On
	}

	timeSinceLastCall(id:=1,reset:="")
	{	static arr
		ListLines,Off
		ListLines,% ("On",(!arr?arr:={}:""),(reset?(arr[id,0]:="",arr[id,1]:="",arr[id,3]:=""):(arr[id,arr[id,2]:=!arr[id,2]]:=A_TickCount,time:=abs(arr[id,1]-arr[id,0]))),(time!=""?this.append(time):""))
	}

	update(debugType:="")
	{	ListLines,Off
		ListLines,% ("On",this.clear(),this.line:=0,this.log(this.debug((debugType?debugType:this.debugprev))))
	}
}

st_printArr(array,depth:=10,indentLevel:="&nbsp;&nbsp;&nbsp;")
{	static parent,pArr,depthP
	For k,v in (Array,(!IsObject(pArr)?pArr:=[]:""),(!depthP?depthP:=depth:""))
		((depthP=depth||depthP<depth)?parent:=SubStr(a:=SubStr(parent,1,InStr(parent,",",0,0)-1),1,InStr(a,",",0,0)):""),k:=RegExReplace(k,","),list.=(indentLevel "arr<span class=Console_DebugID_array>[</span><em>" pArr[depth]:=parent (k&1=""?"""" k """":k) "</em><span class=Console_DebugID_array>]</span>"),((IsObject(v)&&depth>1)?(parent.=k ",",depthP:=depth,list.="`n" st_printArr(v,depth-1,indentLevel "&nbsp;&nbsp;&nbsp;")):list.=" = " v),list.="`n"
	return RTrim(list,"`n")
}
AL_Columnize(Data,delim="csv",justify=1,pad=" ",colsep=" | ") ;Credit @ tidbit,compacted reduced code by AfterLemon
{	Loop,parse,Data,`n,% ("`r",width:=[],Arr:=[],(InStr(justify,"|")?colMode:=StrSplit(justify,"|"):colMode:=justify))
	{	If(delim="csv",row:=a_index)
			Loop,parse,A_LoopField,csv
				Arr[row,a_index]:=A_LoopField
		else Arr[a_index]:=StrSplit(A_LoopField,delim)
		(Arr[a_index].maxindex()>maxc?maxc:=Arr[a_index].maxindex():"")
	}Loop,% maxr:=Arr.maxindex()
	{	Loop,% (maxc,row:=A_Index)
		{	Loop,% ((width[maxc]?0:maxr),col:=a_index,len:=StrLen(stuff:=Arr[row,col]))
				(StrLen(Arr[a_index,col])>width[col]?width[col]:=StrLen(Arr[a_index,col]):""),PadS.=pad pad
			diff:=abs(len-width[col]),out.=((len<width[col],(isObject(colMode)?justify:=colMode[col]:""))?(justify=3?SubStr(PadS,1,floor(diff/2)) stuff SubStr(PadS,1,ceil(diff/2)):(justify=2?SubStr(PadS,1,diff) stuff:stuff SubStr(PadS,1,diff))):stuff) (col!=maxc?colsep:"")
		}out.="`n"
	}return SubStr(out,1,-1)
}
ShellMessage(wParam,lParam)	; this is used for hiding the cmd window in the console.cmd() method.
{	ListLines,Off
	If(wParam=1)
	{	WinGetClass,wclass,ahk_id %lParam%
		If(wclass="ConsoleWindowClass")
			WinHide,ahk_id %lParam%
}}
Eval#(x)	; Evaluate expression with numbers,+ #(subtract) / *
{	xP:=x,RegExMatch(x,"(.*)(\+|#)(.*)",y),x:=(y2="+"?Eval#(y1)+Eval#(y3):(y2="#"?Eval#(y1)-Eval#(y3):xP)),(x=xP?(RegExMatch(x,"(.*)(\*|/)(.*)",y),x:=(y2="*"?Eval#(y1)*Eval#(y3):(y2="/"?Eval#(y1)/Eval#(y3):xP))):"")
	return (x?x:0)
}

