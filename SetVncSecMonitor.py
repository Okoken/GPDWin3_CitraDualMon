#coding:utf-8
import win32api
import pyregedit

#DISPLAY_DEVICE.StateFlags
DISPLAY_DEVICE_ACTIVE = 0x1
DISPLAY_DEVICE_MULTI_DRIVER = 0x2
DISPLAY_DEVICE_PRIMARY_DEVICE = 0x4
DISPLAY_DEVICE_MIRRORING_DRIVER = 0x8
DISPLAY_DEVICE_VGA_COMPATIBLE = 0x10
DISPLAY_DEVICE_REMOVABLE = 0x20
DISPLAY_DEVICE_DISCONNECT = 0x2000000
DISPLAY_DEVICE_REMOTE = 0x4000000
DISPLAY_DEVICE_MODESPRUNED = 0x8000000

root = pyregedit.HKEY_LOCAL_MACHINE
path = r"SOFTWARE\RealVNC\vncserver"
reg = pyregedit.RegEdit(root, path)

# Search virtual display
i = 0
while True:
    try:
        device = win32api.EnumDisplayDevices(None, i)
    except pywintypes.error:
        break

    if (device.StateFlags & DISPLAY_DEVICE_ACTIVE != 0) and (device.DeviceID == "root\iddsampledriver"):
        break
        
    i += 1

# Set virtual display as VNC server target
if reg.check_key():
    key = reg.get_key()
else:
    key = reg.create_key()

reg.create_value('DisplayDevice', pyregedit.REG_SZ, device.DeviceName)