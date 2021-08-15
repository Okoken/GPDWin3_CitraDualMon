# GPDWin3_CitraDualMon
Turn GPD Win 3 + any smart phone to a perfect 3DS emulator with dual monitors.

This tool can let you separate Citra 2 screens to the GPD Win 3 screen and a smart phone connected to a same network, with a single shortcut.
Can check below video to see how it works. Setup instruction can be found in the video the same, or follow the steps in this readme.
Youtube:

Bilibili:


Tools to be downloaded/installed.
1. Citra.
2. Autohotkey.
3. Phython3
   > Remember to add Python to the PATH.
5. Sizer 4.0 "binaries only" version. http://www.brianapps.net/sizer4/
6. Indirect Display Driver Sample. https://github.com/roshkins/IddSampleDriver/releases
7. DevCon-Installer. https://github.com/Drawbackz/DevCon-Installer

Preparation.
1. Download all files in this project and place in a same folder.
2. Create folder named "sizer" and put all the files extracted from Sizer 4.0 "binaries only".
   > After this step the files in the folder are as blow.
     ├ GPDWin3_CitraDualMon.ahk
     ├ SetVncSecMonitor.py
     ├ ...
     └ sizer
        ├ sizer.exe
        ├ ...
        └ hook64.dll
3. Set one of the virtual display to 800x600 resolution, and move it to the top right of the Primary Display (the GPD Win 3 screen).
   Disconnect all other useless virtual displays.
4. Import "SizerExport_GPDWin3_CitraDualMon.xml" included in this project to sizer. Can find the import button in Sizer Configuration -> Load/Save.
   > If you are already using sizer please manually add the configuration since import will overwrite the whole sizer settings.
     Below are the setting details.
       Width: 2304
       Height: 768
       Don't resize windows: unchecked
       Move to: Top Left
       Allow move outside screen bounds: checked
       Relative to: Area covered by all monitors
       Using: Workarea coordinates
       Shortcut key: Shift+Ctrl+Win+Alt+C




