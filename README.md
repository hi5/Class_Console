# Class_Console()

Purpose: 

> This class is meant to simplify debugging for scripts from simple text handling, to outputting and logging data & arrays.

Authors:

> [@AfterLemon](https://github.com/AfterLemon/) and [@tidbit](https://github.com/acorns/)

License:

> [GPL License](LICENSE)

Forked from:

> <https://github.com/AfterLemon/Class_Console> - See [changelog](#changelog-fork-19) for background info of this fork

AHKScript:

> <http://ahkscript.org/boards/viewtopic.php?f=6&t=2116&p=14026>

## Class:

   ```autohotkey
Class_Console(Name,x,y,w,h [,GuiTitle,Timestamp,HTML,Font,Fontsize])

; or as of v1.9 simply calling it like so will create a default console named "console"

Class_Console() 

   ```   

## Methods:

### console.append([text,delim,justify,pad,colsep])

Add text to the end of the console without a timestamp.
Text can be a Variable or Object

### console.catch([line,var,value])

Detect when a variable is a certain value or a certain line of code is executed.

### console.clear()

Remove all the text on the console.

### console.close()

Close the console but don't destroy it. Basically you Hide it.

### console.color([c])

Sets text color for following lines. Default is white.
Specify "list" to see the color table.

**Color Table**

| Name   | Color  |
| -------|--------|
| yellow | yellow |
| orange | orange |
| white  | white *|
| red    | red    |
| blue   | cyan   |
| lime   | lime   |
| green  | green  |
| gray   | gray   |
| black  | black  |

\* default

### console.cmd(command [,breakOn,AppendConsole])

Run (and return) a command-prompt command and get the input line-by-line.

### console.cmdWait(command [,AppendConsole])

Run (and return) a command-prompt command and wait for it to fully finish.

### console.destroy()

Destroy the console, it can not be shown until recreated.

### console.debug(debugType)

Show AHK's debug info: KeyHistory, ListVars (Vars), ListLines (Lines), and ListHotkeys (Hotkeys).

### console.eval(In [,Append])

Evaluate expression with numbers,+ # - / and *.

### console.log([text,delim,justify,pad,colsep])

Same as append, but with a timestamp.

### console.prepend([text,delim,justify,pad,colsep])

Same as append, but adds the text to the TOP (line 1) of the console.
Text can be a Variable or Object

### console.pull()

Get the current console text.

### console.save([FileName,Overwrite (flag)])

Save the console to a file.

### console.show(Name)

Show a closed or recently created console.

### console.timeSinceLastCall([id,reset])

Get the amount of time (in MS) since the last time this function was called.

### console.update(debugType)

This is similar to doing a CLEAR and then LOG(DEBUG()).

## ConsoleBar Commands

### ExitApp

* Desc:    Exits entire script.
* Syntax:  ExitApp

### \*Catch

* Desc:    Detect when a variable is a certain value, OR Detect when a line in ListLines exists.
* Syntax:  catch var varName Value command
* Syntax:  catch var line DebugLineNum Command
* Example: catch var d 4 prepend %d%
* Example: catch line 11 log line 11 was accessed!

### \*Settimer

* Desc:    Run a 

[command] every N milliseconds (1000=1 second, 5000=5 seconds, etc).

* Syntax:  SetTimer N command
* Example: SetTimer 1000 var Banana

### About

Desc:    Show information about this Console and its Creators.
Syntax:  About

### Append

* Desc:    Add text to the end of the console. You may use variables such as %varName%.
* Syntax:  Append Text
* Example: Append I'm at the end of the log! For now...

### Clear

* Desc:    Clear all text in the console.
* Syntax:  Clear

### Close

* Desc:    Close (or hide) the console. It can be re-shown.
* Syntax:  Close

### Cmd

* Desc:    Run cmd.exe commands here. You can ping, run programs, whatever you want. Output will go to the console. This gets stuff line-by-line.
* Syntax:  cmd cmd.exe stuff
* Example: Cmd ipconfig

### CmdWait

* Desc:    Run cmd.exe commands here. You can ping, run programs, whatever you want. Output will go to the console. This waits for the whole command to finish before printing to the console.
* Syntax:  CmdWait cmd.exe stuff
* Example: CmdWait ipconfig

### Color

* Desc:    Apply a color 

[N] to all below lines.

* Available colors: Yellow, Orange, White, Red, Blue, Lime, Green, Gray, Black. Or type 'color list' for a visual list of all the colors.
* Syntax:  Color N|List
* Example: color blue
* Example: color list

### Debug

* Desc:    Get various AHK debugging info such as Last Lines.
* UNIT should be one of the following: Hotkeys, KeyHistory, Lines or Vars
* Syntax:  debug UNIT
* Example: Debug Vars

### Destroy

* Desc:    Destroy the console. It can NOT be re-shown.
* Syntax:  Destroy
* Example: Destroy

### Log

* Desc:    Add text to the end of the console with a formatted timestamp above the new text. You may use variables such as %varName%.
* Syntax:  Log Text
* Example: Log Some new data

### Operators

* Desc:    Create and/or do math or do other unforsaken things to variables, such as append text. You do not need to use quotes around text.
* Available Operators: := .= += -= *= /= //= &= ^= |=
* Syntax:  var+=5
* Example: SomeVar.=New text at the end.

### Prepend

* Desc:    Adds text to the TOP of the console, not the bottom.
* You may use variables such as %varName%.
* Syntax:  Prepend Text
* Example: Prepend I'M ON TOP OF THE WOR... CONSOLE!

### Pull

* Desc:    Pulls data from console window (line/lines specifies the line numbers) and saves it in a variable (or the clipboard).
* Syntax:  Pull 

[lines|line First-Last|N] VarName|Clipboard

* Example: Pull banana
* OR       Pull lines 1-10 banana
* OR       Pull line 3 banana

### Run

* Desc:    Runs a label within the script.
* Syntax:  Run Label
* Example: Run BananaLabel -> BananaLabel: ....

### Save

* Desc:    Save the console text to the specified file.
* Syntax:  Save Filepath
* Example: Save C:\blah\log.txt

### Show

* Desc:    Show a specified closed (not destroyed) console or reshow the current one.
* Syntax:  Show NAME
* Example: Show Variable

### TimeSinceLastCall

* Desc:    ID and Reset are optional. Appends time in milliseconds since the last time this command was run.
* Syntax:  TimeSinceLastCall ID Reset
* Example: TimeSinceLastCall 1

### Update

* Desc:    Uses last Debug UNIT, clearing the log and re-running the debug.
* Syntax:  Update
* Example: Debug vars --> SetTimer 3000 Update

### Var

* Desc:    Print the value of a variable to the console. no %'s needed.
* -1 = Prepend, 1 = Log. Default is Append.
* Syntax:  Var VariableName (-1,0,1)
* Example: Var Banana

# Example:

   ```autohotkey
; create the console with a long time/date timestamp.
; it can now be called using "a." followed by the above method list.
a.new console("title", 100, 100, 500, 300, 1)
a.show() ; show the console we just made
a.log("Hello!")    

; Print your message to it with a timestamp.
a.append("console class!") ; Add another message but with no timestamp.
sleep, 2000

; Wait two seconds before we clear it.
a.clear()  

; Clear (empty the view) console.
a.cmdWait("ipconfig")      ; Show the 'ipconfig' data in your console.
sleep, 3000

; Wait three second.
a.destroy()

; Permenantly destroy the "a." console. It'll need to be recreated for further use.
   ```

### Changelog Fork 1.9+

Ensure variables and objects with HTML content is displayed as "RAW" html
because the contents of variables and texts is displayed in a HTML control
html tags were invisible which was problematic for my personal use

Changes made:

- All CSS classes now have Console_DebugID_ prefix
- Escape <> HTML tags to \&lt; \&gt; in variables & objects displayed by Log, Append, Prepend functions
- Added color styling to Object display
- Default name and position of size & size of Console
