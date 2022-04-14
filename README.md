# IMStandBy_infra
IMStandBy Infra repository

# Bastion, VPN
Подключение к someinternalhost в одну команду из локальной консоли
ssh -A -i ~/.ssh/imstandby.key -J appuser@51.250.14.80 appuser@10.128.0.25

Подключение из локальной консоли ssh по алиасу someinternalhost
Создаем конфиг-файл /.ssh/config следующего содержания
[user@localhost otus]$ cat ~/.ssh/config
Host bastion
        HostName 51.250.14.80
        User appuser
        ForwardAgent yes
        IdentityFile ~/.ssh/imstandby.key
Host someinternalhost
        HostName 10.128.0.25
        ProxyJump %r@51.250.14.80
        IdentityFile ~/.ssh/imstandby.key
        User appuser

bastion_IP = 51.250.14.80
someinternalhost_IP = 10.128.0.25
