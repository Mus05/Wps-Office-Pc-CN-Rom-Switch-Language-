#!/system/bin/sh
# ==========================================================
# Xiaomi Pad 6 - WPS Office PC Level (EN + All-in-One Mode)
# Versi Komuniti (Percuma / Tanpa Token)
# ==========================================================

# --- AUTO-ELEVATE KE ROOT GLOBAL MOUNT NAMESPACE (su -M) ---
if [ "$(id -u)" -ne 0 ]; then
    echo "[*] Meminta akses Root (Magisk Global Namespace)..."
    exec su -M -c "sh \"$0\" \"$@\""
    exit $?
fi

# --- FUNGSI CARI CONTAINER & OFFICE.CONF ---
find_wps_config() {
    CONF=$(find /data /mnt -name "Office.conf" 2>/dev/null | head -n 1)

    # Jika container belum aktif, buka WPS sekejap supaya mslgservice mount sistem fail
    if [ -z "$CONF" ]; then
        echo "[*] Container belum aktif. Membuka WPS Office PC sebentar..."
        monkey -p com.xiaomi.wpslauncher -c android.intent.category.LAUNCHER 1 >/dev/null 2>&1
        sleep 5
        CONF=$(find /data /mnt -name "Office.conf" 2>/dev/null | head -n 1)
    fi

    if [ -z "$CONF" ]; then
        echo "[!] Gagal menjumpai Office.conf."
        echo "    Sila buka aplikasi WPS Office PC secara manual, buka 1 dokumen kosong,"
        echo "    biarkan terbuka di background, dan jalankan skrip ini semula."
        exit 1
    fi

    USER_HOME="${CONF%/.config/Kingsoft/Office.conf}"
}

# --- FUNGSI 1: INSTALL ENGLISH + ALL-IN-ONE (WORD/SHEET/PPT CAMPUR) ---
install_english() {
    find_wps_config

    echo "[*] Lokasi config dijumpai: $CONF"

    # Buka kunci fail jika pernah dikunci sebelum ini
    chattr -i "$CONF" 2>/dev/null

    # Simpan salinan asal sekali sahaja untuk tujuan Uninstall
    if [ ! -f "${CONF}.bak_cn" ]; then
        cp "$CONF" "${CONF}.bak_cn"
        echo "[*] Backup asal disimpan ke: ${CONF}.bak_cn"
    fi

    # Semak jika pek bahasa en_US sedia ada atau perlu disalin dari folder Download
    HAS_EN=$(find /data /mnt /opt /vendor -path "*/office6/mui/en_US" 2>/dev/null | head -n 1)
    if [ -z "$HAS_EN" ]; then
        if [ -d "/sdcard/Download/en_US" ]; then
            echo "[*] Menyalin fail bahasa en_US (Word, Sheet, PPT) ke container..."
            mkdir -p "$USER_HOME/.local/share/Kingsoft/office6/mui"
            cp -rf /sdcard/Download/en_US "$USER_HOME/.local/share/Kingsoft/office6/mui/"
            chmod -R 755 "$USER_HOME/.local/share/Kingsoft/office6/mui/en_US"
        else
            echo "[!] Nota: Folder en_US tiada dalam container & tiada di /sdcard/Download/en_US."
            echo "    Jika bahasa masih Cina selepas restart, letak folder en_US di /sdcard/Download/en_US dan run semula."
        fi
    else
        echo "[*] Fail bahasa en_US terbina dalam dikesan: $HAS_EN"
    fi

    # Tulis konfigurasi English + Mode All-in-One (prome_all)
    cat << 'EOF' > "$CONF"
[General]
languages=en_US
FirstInstallLang=en_US

[6.0]
common\DefaultLanguage=1033
common\Local\UILanguage=1033
wpsoffice\Application%20Settings\AppComponentMode=prome_all
wpsoffice\Application%20Settings\AppComponentModeInstall=prome_all
EOF

    chmod 644 "$CONF"

    # Kunci fail supaya HyperOS/MIUI tidak reset ke bahasa Cina selepas reboot
    chattr +i "$CONF" 2>/dev/null

    echo "[*] Memulakan semula servis WPS Office PC..."
    am force-stop com.xiaomi.wpslauncher
    am force-stop com.xiaomi.mslgrdp

    echo ""
    echo "=========================================="
    echo " [BERJAYA] WPS Office PC kini dalam English!"
    echo " - Word, Sheet & PPT digabung dalam 1 window (Tab Mode)"
    echo " - Sila buka semula aplikasi WPS Office PC sekarang."
    echo "=========================================="
}

# --- FUNGSI 2: UNINSTALL / PULIHKAN KE BAHASA ASAL (CN) ---
uninstall_english() {
    find_wps_config

    echo "[*] Membuka kunci konfigurasi..."
    chattr -i "$CONF" 2>/dev/null

    if [ -f "${CONF}.bak_cn" ]; then
        echo "[*] Memulihkan fail backup asal (Chinese)..."
        cp -f "${CONF}.bak_cn" "$CONF"
        rm -f "${CONF}.bak_cn"
    else
        echo "[*] Backup tidak dijumpai, menetapkan semula ke lalai zh_CN..."
        cat << 'EOF' > "$CONF"
[General]
languages=zh_CN
FirstInstallLang=zh_CN

[6.0]
common\DefaultLanguage=2052
common\Local\UILanguage=2052
EOF
    fi

    # Buang pek bahasa tambahan jika pernah disalin ke local user
    if [ -d "$USER_HOME/.local/share/Kingsoft/office6/mui/en_US" ]; then
        rm -rf "$USER_HOME/.local/share/Kingsoft/office6/mui/en_US"
        echo "[*] Fail bahasa tambahan en_US dibuang."
    fi

    chmod 644 "$CONF"

    echo "[*] Memulakan semula servis WPS Office PC..."
    am force-stop com.xiaomi.wpslauncher
    am force-stop com.xiaomi.mslgrdp

    echo ""
    echo "=========================================="
    echo " [BERJAYA] WPS Office PC dipulihkan ke asal!"
    echo "=========================================="
}

# --- MENU UTAMA ---
clear
echo "=========================================="
echo "   WPS OFFICE PC LEVEL - LANGUAGE TOOL    "
echo "   (Word + Sheet + PPT All-in-One Mode)   "
echo "=========================================="
echo "1. Install English + All-in-One Tab Mode"
echo "2. Uninstall (Pulihkan Bahasa Cina Asal)"
echo "3. Keluar"
echo "=========================================="
printf "Pilih nombor [1-3]: "
read -r CHOICE

case "$CHOICE" in
    1)
        install_english
        ;;
    2)
        uninstall_english
        ;;
    3)
        echo "Keluar."
        exit 0
        ;;
    *)
        echo "[!] Pilihan tidak sah."
        exit 1
        ;;
esac
