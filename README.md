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

# Cloud-testapp
testapp_IP = 51.250.80.152
testapp_port = 9292

Команда для CLI  создания инстанса - "yc compute instance create --name reddit-app --hostname reddit-app --memory=4 --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 --metadata serial-port-enable=1 --metadata-from-file user-data=startup_instance.yaml"
