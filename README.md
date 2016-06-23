# sshcontine
sshcontine
通过`usr/bin/ssh -nNTf -D 7000 -i /Users/sunyanguo/tokyokeypair.pem centos@54.65.45.216` 这样的命令来上网的，需要保持ssh连接不断开，或者断开的时候能自动重连

mac os x ssh continue check & connection
`com.lvmama.sshcontine.plist`里的`sunyanguo`修改成自己用户名
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
ssh 连接成功后 需要在网络里配置SOCKS代理 localhost 7000