#!/bin/bash
set -e

# All Code Created By Mfsavana
# Don't Use And Steal Code
# License Apache License 2.0
# Credit Mfsavana © 2026

# ================== COLORS ==================
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
MAGENTA='\033[1;35m'
WHITE='\033[1;37m'
RESET='\033[0m'

# ================== UI ELEMENTS ==================
divider () {
    echo -e "${MAGENTA}────── ⋆⋅☆⋅⋆ ──────${RESET}"
}

box () {
    echo -e "${CYAN}╔══════════════════════════════════════╗${RESET}"
    echo -e "${CYAN}║${RESET} ${WHITE}$1${RESET}"
    echo -e "${CYAN}╚══════════════════════════════════════╝${RESET}"
}

delay () {
    sleep 1.2
}

print_step () {
    clear
    divider
    box "$1"
    divider
    delay
}

print_done () {
    echo -e "\n${GREEN}✔ $1${RESET}"
    delay
}

print_skip () {
    echo -e "\n${YELLOW}➜ SKIP: $1${RESET}"
    delay
}

print_fail () {
    echo -e "\n${RED}✖ $1${RESET}"
    exit 1
}

# ================== ROOT CHECK ==================
if [ "$EUID" -ne 0 ]; then
    print_fail "Run this installer as root (sudo)"
fi

# ================== INTRO ==================
clear
divider
box "Fail2Ban Safe Installer"
echo -e "${CYAN} Created by ${WHITE}Mfsavana${RESET}"
echo -e "${BLUE} Clean • Automatic • Pterodactyl Safe${RESET}"
divider
sleep 2

# ================== STEP 1 ==================
print_step "INSTALL FAIL2BAN"
apt update -qq
apt install -y fail2ban >/dev/null
systemctl enable fail2ban >/dev/null
print_done "Fail2Ban installed"

# ================== STEP 2 ==================
print_step "CLEAN OLD CONFIGURATION"
rm -f /etc/fail2ban/jail.local
rm -f /etc/fail2ban/jail.d/*.local
print_done "Old configuration cleaned"

# ================== STEP 3 ==================
print_step "CONFIGURE SSH PROTECTION"
cat > /etc/fail2ban/jail.d/sshd.local << 'EOF'
[sshd]
enabled = true
backend = systemd
port = ssh
maxretry = 5
findtime = 10m
bantime = 1h
EOF
print_done "SSH brute-force protection enabled"

# ================== STEP 4 ==================
print_step "CONFIGURE PANEL PROTECTION (NGINX)"
if command -v nginx >/dev/null 2>&1; then
cat > /etc/fail2ban/jail.d/nginx.local << 'EOF'
[nginx-http-auth]
enabled = true
port = http,https
backend = systemd

[nginx-limit-req]
enabled = true
port = http,https
backend = systemd
EOF
    print_done "Nginx protection enabled (safe mode)"
else
    print_skip "Nginx not installed, skipping panel protection"
fi

# ================== STEP 5 ==================
print_step "RESTART FAIL2BAN"
systemctl restart fail2ban
sleep 2

if systemctl is-active --quiet fail2ban; then
    print_done "Fail2Ban running successfully"
else
    print_fail "Fail2Ban failed to start (check logs)"
fi

# ================== STEP 6 ==================
print_step "VERIFY STATUS"
fail2ban-client status || print_fail "Fail2Ban client error"
print_done "Fail2Ban jails loaded"

# ================== FINISH ==================
clear
divider
box "INSTALLATION COMPLETE"
echo -e "${GREEN} Status    : ${WHITE}ACTIVE${RESET}"
echo -e "${GREEN} SSH       : ${WHITE}Protected${RESET}"
echo -e "${GREEN} Panel     : ${WHITE}Protected (Safe Mode)${RESET}"
echo -e "${GREEN} Wings     : ${WHITE}Untouched${RESET}"
echo -e "${GREEN} GameSrv   : ${WHITE}Untouched${RESET}"
divider
echo -e "${CYAN} This setup is optimized for:${RESET}"
echo -e "${WHITE} • Pterodactyl Panel & Wings${RESET}"
echo -e "${WHITE} • NodeJS Applications${RESET}"
echo -e "${WHITE} • Minecraft / Terraria / SAMP${RESET}"
divider
echo -e "${MAGENTA} Created by Mfsavana © 2026${RESET}"
divider
