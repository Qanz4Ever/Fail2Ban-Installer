# 🛡️ Safe Fail2Ban Blueprint Installer

A **clean, safe, and production-ready Fail2Ban installer** designed specifically for:

- **Pterodactyl Panel**
- **Pterodactyl Wings**
- **NodeJS Applications**
- **Game Servers** (Minecraft, Terraria, SAMP, etc.)

Built with a **MFSAVANA-Style UI/UX**, this installer focuses on **security without breaking services**.

---

## ✨ Features

- ✅ One-command install (**install → setup → done**)
- 🔐 SSH brute-force protection
- 🧩 Safe Nginx protection for Pterodactyl Panel
- 🎮 Game server friendly (no false bans)
- ⚙️ Wings & WebSocket safe
- 💄 Clean Blueprint-style terminal UI

---

## ❌ What This Installer Does NOT Do

This project intentionally avoids unsafe practices:

- ❌ No port scan detection
- ❌ No UDP inspection
- ❌ No aggressive bad-bot rules
- ❌ No manual iptables manipulation
- ❌ No Cloudflare dependency

Why?  
Because **most Fail2Ban guides break game servers and Pterodactyl Wings**.

---

## 🧠 Why This Exists

Most Fail2Ban setups online are made for **web-only servers**.

When applied to:
- Pterodactyl
- Wings
- Game servers

They often cause:
- False bans
- Broken WebSocket connections
- Random player disconnects

This installer solves that problem by using **only proven, safe jails**.

---

## 🔒 Active Protections

| Service | Status |
|------|------|
| SSH | ✅ Enabled |
| Nginx HTTP Auth | ✅ Enabled |
| Nginx Rate Limit | ✅ Enabled |
| Pterodactyl Wings | 🟢 Untouched |
| Game Server Ports | 🟢 Untouched |

---

## 🖥️ Supported Systems

- Ubuntu **22.04 LTS**
- Ubuntu **24.04 LTS**
- Debian-based systems

> ⚠️ Only Ubuntu/Debian are officially supported.

---

## 🚀 Installation

With Useful Commands Feature:

```bash
curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/safe-fail2ban-blueprint/main/safe-fail2ban-blueprint.sh | sudo bash
```


Without Useful Commands Feature (Instant):


```bash
bash <(curl -fsSL )
```

---

## 🧪 Useful Commands

```bash
fail2ban-client status
fail2ban-client status sshd
fail2ban-client set sshd unbanip <IP>
tail -f /var/log/fail2ban.log
```

---

## 🛑 Important Notes

- This is **NOT a full DDoS protection system**
- Large Layer 3 / Layer 4 attacks must be handled by your VPS provider
- This tool protects against:
  - Brute-force
  - Abuse
  - Login spam
  - Small-scale attacks

---

## 📜 Licensing

This repository uses a **dual-license system**.

### 1️⃣ Apache License 2.0 (Primary License)

Most files are licensed under **Apache License 2.0**, allowing:

- Use
- Modification
- Redistribution

See the `LICENSE` file for full terms.

---

### 2️⃣ MFSAVANA SECURITY LICENSE v1.0 (Secondary / Restricted)

Certain sensitive files are licensed under a stricter license.

These include (but are not limited to):

- Installer scripts
- Uninstaller scripts
- Security patches
- Anti-modification systems
- Anti-access controllers

Under this license, the following are **strictly prohibited**:

- Reuploading or redistributing protected files
- Selling or commercially repackaging any part of the project
- Publishing modified versions
- Removing or altering credits, markers, or license notices
- Sharing modified or original versions publicly

These files are **source-available but NOT open-source**.

See `LICENSE-MFSAVANA` for full terms.

---

## 👤 Author

**Mfsavana**  
Blueprint Framework Author  
© 2026

---

## ⭐ Credits

Inspired by real-world Pterodactyl production setups  
Built for stability, not hype
