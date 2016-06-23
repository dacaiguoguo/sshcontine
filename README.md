# sshcontine
sshcontine
mac os x ssh continue check & connection
将`com.lvmama.sshcontine.plist copy` 到`~/Library/LaunchAgents` 下
```
sudo chmod 600 ~/Library/LaunchDaemons/com.lvmama.sshcontine.plist

```
```
sudo chown root ~/Library/LaunchDaemons/com.lvmama.sshcontine.plist
```
```
launchctl load ~/Library/LaunchDaemons/com.lvmama.sshcontine.plist
```
如果要停止开机运行
```
launchctl unload ~/Library/LaunchDaemons/com.lvmama.sshcontine.plist
```

注意第一次需要手动ssh链接下，第一次链接的时候要输入yes 同意ssh链接。