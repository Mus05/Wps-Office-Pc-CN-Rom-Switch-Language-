====================================================================
WPS OFFICE PC LEVEL LANGUAGE SWITCHER GUIDE (CN TO EN)
Device   : Xiaomi Pad 6 (Rooted)
Features : English UI (en_US) + All-in-One Tab Mode (Word/Sheet/PPT)
====================================================================

1. PREREQUISITES
--------------------------------------------------------------------
* Rooted tablet (Magisk / KernelSU / APatch).
* WPS Office PC Level (com.xiaomi.wpslauncher) is installed.
* Termux is installed (use the official F-Droid or GitHub release;
  avoid the outdated Google Play Store version).
* The script file 'wps_en_manager.sh' is saved inside your Download
  folder (/sdcard/Download/).


2. STEP-BY-STEP INSTRUCTIONS
--------------------------------------------------------------------
[Step 1] Initialize the WPS Container
  Open WPS Office PC once, create or open one blank document, and
  leave the app running in the background so the Linux container
  mounts its filesystem.

[Step 2] Open Termux & Run the Script
  Open Termux, enter the command below, and press Enter:

      sh /sdcard/Download/wps_en_manager.sh

  *Important Note: You MUST prefix the command with 'sh'. Do NOT use
   './' because Android's Download storage blocks direct execution.

[Step 3] Grant Root Permission
  Tap 'Grant' when the Superuser / Root permission pop-up appears.

[Step 4] Select an Option from the Menu
  * Press 1 then Enter -> Install English + All-in-One Tab Mode
                          (English UI + combines Word, Sheet, PPT,
                           and PDF tabs into a single window)
  * Press 2 then Enter -> Uninstall
                          (Restores original Chinese language & config)

[Step 5] Relaunch WPS Office PC
  Once Termux displays '[BERJAYA]' (Success), reopen WPS Office PC
  from your home screen. All menus and ribbons will now be in English.


3. TROUBLESHOOTING
--------------------------------------------------------------------
* 'Permission denied' error:
  Make sure you run 'sh /sdcard/Download/wps_en_manager.sh' instead
  of './wps_en_manager.sh'.

* 'Gagal menjumpai Office.conf' (Office.conf not found):
  Open WPS Office PC first, open 1 blank document, leave it in the
  background, and run the script again.

* UI still displays in Chinese after restarting:
  Place the 'en_US' language pack folder inside '/sdcard/Download/en_US',
  then run the script again in Termux and select option 1.

* Reverts to Chinese after a system/ROM update:
  Run the script again in Termux and select option 1 to re-lock the
  configuration file (chattr +i).
====================================================================
