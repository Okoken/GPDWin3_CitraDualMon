# GPDWin3_CitraDualMon
Turn GPD Win 3 + any smart phone to a perfect 3DS emulator with dual monitors.

This tool can let you separate Citra 2 screens to the GPD Win 3 screen and a smart phone connected to a same network, with a single shortcut.  
Can check below video to see how it works. Setup instruction can be found in the video the same, or follow the steps in this readme.  
# Youtube:  

# Bilibili:  


Tools to be downloaded/installed.
1. Citra.
2. Autohotkey.
3. RealVNC server (and client on your phone)  
   > Why RealVNC? Because it is the only VNC know so far can select monitor in the server side.  
   > Note that only enterprise version can support direct connect, and if you don't use RealVNC all the time can set the VNC server service to "Manual" in services.msc  
4. Phython3
   > Remember to select "Add Python to the PATH".
5. Sizer 4.0 "binaries only" version. http://www.brianapps.net/sizer4/
6. Indirect Display Driver Sample. https://github.com/roshkins/IddSampleDriver/releases
7. DevCon-Installer. https://github.com/Drawbackz/DevCon-Installer
   > Remember to select "Add DevCon to the PATH".  

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
4. Import "SizerExport_GPDWin3_CitraDualMon.xml" included in this project to sizer.  
   Can find the import button in Sizer Configuration -> Load/Save.
   > If you are already using sizer please manually add the configuration since import will overwrite the whole sizer settings.  
     Below are the setting details.  
       - Width: 2304  
       - Height: 768  
       - Don't resize windows: unchecked  
       - Move to: Top Left  
       - Allow move outside screen bounds: checked  
       - Relative to: Area covered by all monitors  
       - Using: Workarea coordinates  
       - Shortcut key: Shift+Ctrl+Win+Alt+C  
5. Use below commands to add neccessary package for Python.
   > pip install pywin32  
     pip install pyregedit
6. (Optional) If your citra is not installed in the default path, replace below path with the correct one.
   > C:\Users\%A_UserName%\AppData\Local\Citra\canary-mingw\citra-qt.exe
7. (Optional) If your citra configuration is not in the default path, replace below path with the correct one.
   > C:\Users\%A_UserName%\AppData\Roaming\Citra\config
8. (Optional) If your citra is not canary but nighty, replace the window title as below.  
   > "Citra Canary | HEAD-" to "Citra Nighty | HEAD-"  

# How to start?
1. Convert the GPDWin3_CitraDualMon.ahk to exe and start with Administrator mode (recommended), or directly start GPDWin3_CitraDualMon.ahk with Administrator mode.
2. Make sure Citra is closed.
3. Push down both the L stick, R stick, L trigger, then finally push down the LB button.
4. After Citra automatically poping up, select your game and wait until it automatically expands to full screen.
5. Use the vnc client in your phone to connect the vnc server on your pc.
6. Enjoy!

# How to end?
1. Push down both the L stick, R stick, R trigger, then finally push down the RB button.
2. Close the GPDWin3_CitraDualMon.  
  
Additionally,  
Thanks for orazdow. Some codes are extracted from orazdow's script.
   > https://gist.github.com/orazdow/8479a5af2a4649edf106471916c127d5  

Thanks for Barrow, kon, Hastarin and WAZAAAAA. Some codes are extracted from the script created by them.
   > http://www.autohotkey.com/board/topic/78903-yabt-yet-another-borderless-window-toggle/page-2#entry650488
