# Xiaomi Pad 6 — WPS Office PC Level Language Switcher (CN ➔ EN)

A lightweight, community-friendly shell script (`wps_en_manager.sh`) and step-by-step guide to switch **WPS Office PC Level** (`com.xiaomi.wpslauncher`) from **Chinese (`zh_CN`)** to **English (`en_US`)** directly on your Xiaomi Pad 6 using Termux — **no PC or laptop required**.

---

## ✨ Features / Ciri-Ciri Utama

* **Full English Interface (`en_US`):** Converts menus, ribbons, and settings from Simplified Chinese to English.
* **All-in-One Tab Mode (`prome_all`):** Combines **Word, Sheet, PPT, and PDF** documents as tabs inside a single window instead of separate windows.
* **Auto-Backup & Safe Uninstall:** Automatically backs up your original Chinese configuration (`Office.conf.bak_cn`) and includes a one-click option to restore the default state.
* **Persistent Across Reboots:** Locks the updated configuration (`chattr +i`) so HyperOS/MIUI container services do not overwrite it back to Chinese.
* **Beginner-Friendly Guides Included:** Comes with ready-to-read **PDF** and **TXT** guides in both **English** and **Bahasa Melayu**.

---

## 📂 Repository Contents

| File | Description |
| :--- | :--- |
| `wps_en_manager.sh` | Main interactive Termux script (Install EN / Uninstall CN) |
| `InstallationEnglish.md` | Visual 1-page setup & troubleshooting guide (English) |
| `InstallationMalay.md` | Visual 1-page setup & troubleshooting guide (Bahasa Melayu

---

## 📋 Requirements

* **Device:** Xiaomi Pad 6 with **WPS Office PC Level** installed.
* **Root Access:** Magisk, KernelSU, or APatch.
* **Termux:** Official release from [F-Droid](https://f-droid.org/packages/com.termux/) or [GitHub](https://github.com/termux/termux-app/releases) *(avoid the outdated Google Play Store version)*.

---

## 🚀 Quick Start

1. Download **`wps_en_manager.sh`** and place it in your **`Download`** folder (`/sdcard/Download/`).
2. Open **WPS Office PC** once, open a blank document, and leave the app running in the background.
3. Open **Termux** and run:
   ```bash
   sh /sdcard/Download/wps_en_manager.sh
   
