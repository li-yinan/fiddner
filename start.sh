#!/bin/bash
function setProxy() {
    echo 正在设置代理服务器……
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -v ProxyEnable -t REG_DWORD -d 1 -f
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -v ProxyServer -d "127.0.0.1:8893" -f
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -v ProxyOverride -t REG_SZ -d "" -f

    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -v AutoConfigURL -t REG_SZ -d "file://d:/pac" -f
    echo 正在刷新设置……
    ipconfig -flushdns
};
function clearProxy() {
    echo 正在清空代理服务器设置……
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -v ProxyEnable -t REG_DWORD -d 0 -f
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -v ProxyServer -d "" -f
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -v ProxyOverride -t REG_SZ -d 0 -f
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -v AutoConfigURL -t REG_SZ -d "" -f
    echo 代理服务器设置已经清空

    ipconfig -flushdns
};
trap '{ clearProxy; exit 1; }' ABRT HUP INT QUIT TERM
setProxy;
node index.js
