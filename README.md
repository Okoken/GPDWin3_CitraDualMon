# GPDWin3_CitraDualMon
Turn GPD Win 3 + any smart phone to a perfect 3DS emulator with dual monitors.

This tool can let you separate Citra 2 screens to the GPD Win 3 screen and a smart phone connected to a same network, with a single shortcut.  
本工具可以一键启动Citra并将上下屏幕分辨投射到GPD Win3的主屏幕和另一台处于同一网络的手机上。  
Can check below video to see the demo.   
可观看以下视频了解实际效果。  
# Youtube:  

# Bilibili:  


Tools to be downloaded/installed.  
需下载或安装的工具  
1. Citra
2. Autohotkey
3. RealVNC server (and RealVNC client on your phone)  /  RealVNC 服务端 (还有手机上的 RealVNC 客户端)  
   > Why RealVNC? Because it is the only VNC know so far can select monitor in the server side...  
   > 歪RealVNC？因为它是唯一一个我知道的可以在服务端选择投射哪个屏幕的VNC。。。  
   > Note that only enterprise version can support direct connect, and if you don't use RealVNC all the time can set the VNC server service to "Manual" in services.msc  
   > 注意只有加入enterprise才支持直连，还有如果平时不用RealVNC的话可以进入services.msc把VNC server设成手动。  
4. Phython3
   > Remember to select "Add Python to the PATH".  
   > 记得选"Add Python to the PATH"。  
5. Sizer 4.0 "binaries only" version http://www.brianapps.net/sizer4/
6. Indirect Display Driver Sample https://github.com/roshkins/IddSampleDriver/releases
7. DevCon-Installer https://github.com/Drawbackz/DevCon-Installer
   > Remember to select "Add DevCon to the PATH".  
   > 记得选"Add DevCon to the PATH"。  

Preparation.
1. Download all files in this project and place in a same folder.  
   下载所有文件并放到同一文件夹内。  
2. Create folder named "sizer" and put all the files extracted from Sizer 4.0 "binaries only".  
   创建文件夹"sizer"并把Sizer 4.0 "binaries only"的文件全都加压进去。  
   > After this step the files in the folder are as blow.  
   > 完成后可以看到文件夹的结构如下。  
     ├ GPDWin3_CitraDualMon.ahk  
     ├ SetVncSecMonitor.py  
     ├ ...  
     └ sizer  
       ├ sizer.exe  
       ├ ...  
       └ hook64.dll  
3. Set one of the virtual display to 800x600 resolution, and move it to the top right of the Primary Display (the GPD Win 3 screen).  
   把其中一个虚拟显示器的分辨率设置为800x600，并移动到主显示器（GPD Win3 屏幕）的右上角。  
   Disconnect all other useless virtual displays.  
   断开其他不需要的虚拟显示器。  
4. Import "SizerExport_GPDWin3_CitraDualMon.xml" included in this project to sizer.  
   把本项目内的"SizerExport_GPDWin3_CitraDualMon.xml"导入到sizer里。  
   Can find the import button in Sizer Configuration -> Load/Save.  
   导入按钮可以在Sizer Configuration -> Load/Save里找到。  
   > If you are already using sizer please manually add the configuration since import will overwrite the whole sizer settings.  
   > 如果你本来就有使用sizer的话请手动添加如下设置，因为导入功能会覆盖所有其他设置。  
       - Width: 2304  
       - Height: 768  
       - Don't resize windows: unchecked / 不选择  
       - Move to: Top Left  
       - Allow move outside screen bounds: checked / 选择  
       - Relative to: Area covered by all monitors  
       - Using: Workarea coordinates  
       - Shortcut key: Shift+Ctrl+Win+Alt+C  
5. Use below commands to add neccessary package for Python.  
   使用以下命令安装需要的Python功能包。  
   > pip install pywin32  
     pip install pyregedit
6. (Optional) If your citra is not installed in the default path, replace below path in the GPDWin3_CitraDualMon.ahk with the correct one.  
   （可选）如果你的citra不是安装在默认路径，请替换GPDWin3_CitraDualMon.ahk内以下路径为正确路径。  
   > C:\Users\%A_UserName%\AppData\Local\Citra\canary-mingw\citra-qt.exe
7. (Optional) If your citra configuration is not in the default path, replace below path in the GPDWin3_CitraDualMon.ahk with the correct one.  
   （可选）如果你的citra configuration不是在默认路径，请替换GPDWin3_CitraDualMon.ahk内以下路径为正确路径。  
   > C:\Users\%A_UserName%\AppData\Roaming\Citra\config
8. (Optional) If your citra is not canary but nighty, replace the window title in the GPDWin3_CitraDualMon.ahk as below.  
   （可选）如果你的citra不是canary而已nighty版本，请按如下方法替换GPDWin3_CitraDualMon.ahk内的window title。  
   > "Citra Canary | HEAD-" to "Citra Nighty | HEAD-"  

# How to start? / 如何开始？  
1. Convert the GPDWin3_CitraDualMon.ahk to exe and start with Administrator mode (recommended), or directly start GPDWin3_CitraDualMon.ahk with Administrator mode.  
   把GPDWin3_CitraDualMon.ahk转换成exe并以管理员模式打开（推荐此方法），或者直接以管理员模式打开GPDWin3_CitraDualMon.ahk。  
2. Make sure citra is closed.  
   确保citra已关闭。
3. Push down both the L stick, R stick, L trigger, then finally push down the LB button.  
   按下左摇杆，右摇杆，左扳机，最后按下LB按键。  
4. After citra automatically poping up, select your game and wait until it automatically expands to full screen.  
   等待citra自动打开后，选择游戏并等待游戏自动全屏化。  
5. Use the vnc client in your phone to connect the vnc server on your pc.  
   以手机的VNC客户端连接pc的VNC服务器。  
6. Enjoy!  
   开搞！  

# How to end? / 如何结束？
1. Push down both the L stick, R stick, R trigger, then finally push down the RB button.  
   按下左摇杆，右摇杆，右扳机，最后按下RB按键。  
3. Close the GPDWin3_CitraDualMon.  
   关闭GPDWin3_CitraDualMon。  

Additionally,  
Thanks for orazdow. Some codes are extracted from orazdow's script.
   > https://gist.github.com/orazdow/8479a5af2a4649edf106471916c127d5  

Thanks for Barrow, kon, Hastarin and WAZAAAAA. Some codes are extracted from the script created by them.
   > http://www.autohotkey.com/board/topic/78903-yabt-yet-another-borderless-window-toggle/page-2#entry650488
