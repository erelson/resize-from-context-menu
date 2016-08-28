; GUI
Gui, Add, Text,, Files will be named as Name##.jpg:
Gui, Add, Text,, Name base (no extension):
Gui, Add, Edit, vName, Name
Gui, Add, Text,, Count from:
Gui, Add, Edit, vCount, 1
Gui, Add, Text,, Long side (px):
Gui, Add, Edit, vPixels, 1000
Gui, Add, Text,, Output extension:
Gui, Add, Edit, vExt, jpg
Gui, Add, Button, Default, Batch
Gui, Show
return

; On clicking the button
ButtonBatch:
Gui, Submit
; Iterate through all command line arguments passed to AHK 
Loop, %0%  ; For each parameter:
{
    num := Count + A_Index - 1
    param := %A_Index%
    if num < 10
      Prefix := "0"
    else
      Prefix := ""
    run `"C:\Program Files (x86)\IrfanView\i_view32.exe`" %param% /resize_long=%Pixels% /aspectratio /convert=%Name%%Prefix%%num%.%Ext%
}
ExitApp
return

; Do nothing if just exiting
GUIClose:
GUIEscape:
ExitApp
return
