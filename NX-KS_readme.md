NX-KS Mod-pack

How to install:

 1) start with a clean memory card (no files), **turn-on your
Bluetooth**

2) unzip the contents of the zip into the root of the sdcard

3) put the card in the camera, and start the camera

4) have some patience (there can be 1 or 2 auto-reboots)

5) when BT-Mod is complete there will be **\[ All Done \]** message

6) after boot, you will see **\[ NX-KS\]** button on the top of the
screen\
- (**if you don\'t see it in 15 seconds, turn on the Bluetooth**)

 * x) to uninstall select: main menu \> settings\> Uninstall Mod*

Key-combinations EV+\*:

AEL : Stealth Video Rec

UP : load UP profile

DOWN : load DN profile

RIGHT : Turn ON/OFF touchscreen

LEFT : Sleep

Half-Press-Shutter : focus pull

mobile : telnet+ftp

EV *(double-click EV) *: Main Menu (NX500)

OK : Main Menu (NX1) / Overlay ON/OFF (NX500)

Main Menu

Time-Lapse Custom Functions

Focus + Profiles Settings

Hibernate Sleep

Time-Lapse

Wake Lapse - Schedule time-lapse

Ramping - Time-lapse with ramping capabilities\

Custom Functions

Remote Save Video Bitrates (set custom bitrates)

ZoomZoom Mod Resolution

Batch Recording HDR ( 5-image HDR, from 1/15 to 1/6000)

Mod-Version Camcorder Mode (Shutter button for video Rec)

** Focus + Profiles **

Focus Stacking

Focus Buttons

Auto-Peak (HalfShutter enables peaking, use OK to end peaking)

Pull Speed (set focus-pull speed used on EV+HalfShutter)\
Custom Buttons ( My Checkbox / My Button )

** Profiles**

save/load UP or DN profile

save/load FullBackup (all camera settings)

Saved profiles are stored in /sdcard/presets/

and you can copy and backup them as needed.

Settings

> Silent Shutter (nx500 only)

> Mod Resolutions (nx500 only, change resolution for a given video
> setting)

> No Rec Limit (note there are problems with longer than 70min files.

> On nx500, this patch does not affect 4K/UHD time-limit,\
> but you can mod VGA resolution to 4K/UHD, and avoid the 15 minute time
> limit, without applying this patch )

> Refocus on Boot (return to last focus after hibernation)

> No Lens Release (for faulty mounts -- take pictures/video without a
> detected lens)

> Enable Bluetooth (use this to enable Bluetooth functionality while the
> mod is installed)

> Overlay ( if exists, loads /sdcard/overlay.png otherwise shows a 3x3
> grid )

> Uninstall Mod

Added Functionality

Focus buttons

Program that displays series of buttons on top of the screen

long press (1+s) to save current focus position

click to restore saved focus position

Can be used for studio shooting, astrophotography

(focus on infinity during day, recall the focus during the night), etc.

Focus stacking

Focus on near point - press \"Near\"

Focus on far point - press \"Far\"

Click \"Stack\" and wait for it to finish

Files are in the usual place - remember to fix exposure/awb/etc as you
normally would

**Focus pull** (EV+half-press shutter button)

Focus on subject 1

press EV+half-press shutter button

Focus on subject 2

Consecutive EV+half-press shutter button will be switching between focus
of the two subjects.

Adjusting focus is possible is possible at any time.

Refocus on Boot

When using hibernation (EV+AEL or Menu\>Hibernate) the camera records
last focus distance

If this option is enabled, camera will refocus to that focus distance on
boot

Batch recording

When started, the camera starts recording for a selected time length,
and auto-starts new clips until \"Rec\" is pressed. If there is
time-limit in the camera for the given type you are recording, you need
to choose the length for the batch-capture to be smaller. Blackout mode
will attempt to hide all camera activity, and will show only LED
blinking for 2 seconds on the start of each clip.

Remote Save

Interface for setting credentials and starting nx-netfs, which needs
separate install. Instructions and Download:
<https://github.com/mewlips/nx-netfs>

**Wake Lapse**

Setup a Time-lapse with delayed start. Puts camera to sleep for used
defined time period, upon wake-up it starts by refocusing to the focus
position when Wake Lapse was started, and then starts taking images with
user specified time-gap between them, for user-specified duration.

Ramping

Setup a Time-lapse with delayed start and define a ramp exposure speed
change. You set exposure start and exposure end, ramp start and
time-length. Exposure change uses an easing function to further smooth
transition. Strongly advised is to use a manual lens, or switch aperture
to manual so the iris never moves between pictures.

On start, the camera is put to sleep for used defined time period (if
delayed start is not 0), upon wake-up it starts by refocusing to the
focus position when Ramping was started, and then starts taking images
with user specified time-gap between them, for user-specified duration.
When reaching ramp-start time, the exposure gradually starts to change
until it reaches the end-exposure level for the preset time period.
After that taking picture continuous up to reaching the end of the
preset "total time" for the time-lapse.

Custom Buttons ( My Checkbox / My Button )

Add your own custom functionality with custom button and checkbox. For
customizing the button, add your custom script as
"*/sdcard/mod/cButton.sh"*. The script will be executed each time you
press "My Button". To customize the checkbox, add your script as
"*/sdcard/mod/cCheckbox.sh*". That script will be auto-executed on start
unless the you uncheck the checkbox. Unchecking the checkbox removes the
start script from auto execution on start, and runs
"*/sdcard/mod/off_cCheckbox.sh".*

**Thanks to Otto** for the programs that make this possible - keyscan,
gui, focus stacking, focus buttons, \... to name a few.\
The hub for all information and tools:
<https://github.com/ottokiksmaler/nx500_nx1_modding>

**Thanks to Mewlips** for the nx-remote-controller-mod.\
Project Homepage: <https://mewlips.github.io/nx-remote-controller-mod>

GitHub: <https://github.com/mewlips/nx-remote-controller-mod>

nx-netfs: <https://github.com/mewlips/nx-netfs>\

Donations

Q: So, where\'s the **Donate** button? A: Nowhere. Find a suitable
charity and donate. If you cannot afford it, find a local charity and
see if they need help in person - it will do you a world of good.\

Latest version: <https://www.facebook.com/NXKS2/>
