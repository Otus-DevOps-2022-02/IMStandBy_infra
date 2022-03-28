# IMStandBy_infra
IMStandBy Infra repository
#Подключение к someinternalhost в одну команду из локальной консоли
ssh -A -i ~/.ssh/imstandby.key -J appuser@51.250.69.168 appuser@10.128.0.25

#Подключение из локальной консоли ssh по алиасу someinternalhost
#Создаем конфиг-файл /.ssh/config следующего содержания
[user@localhost otus]$ cat ~/.ssh/config
Host 10.128.0.25
        ProxyJump %r@51.250.69.168
        IdentityFile ~/.ssh/imstandby.key
        User appuser
#Проверяем заход по алиасу
[user@localhost otus]$ ssh someinternalhost
Welcome to Ubuntu 16.04.7 LTS (GNU/Linux 4.4.0-142-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
appuser@someinternalhost:~$
