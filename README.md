# KKisilevsky_infra
KKisilevsky Infra repository

# Bastion host SSH forwarding with alias for destination host
# Необходимо сгенерировать ssh key для подключения к серверу

ssh-add ~/.ssh/kkisilevsky # добавляем ключ
eval $(ssh-agent -s) # запускаем агент
nano ~/.ssh/config # редактируем файл

Host    84.201.138.84
        ForwardAgent yes

Host    someinternalhost
        Hostname 10.129.0.25
        User kkisilevsky
        ProxyCommand ssh -A kkisilevsky@84.201.138.84 -W %h:%p

# Open VPN
# Установить сервер можно с помощью скрипта setupvpn.sh используя команду "sudo bash setupvpn.sh"
# После успешной настройки сервера необходимо открыть назначеный порт (16270/udp) на сервере bastion 
sudo iptables -A INPUT -p udp -m udp --dport 16270 -j ACCEPT 
# Для подключения необходимо использовать OpenVPN клиент (Tunnelblick), добавив в него конфигурационный файл *.ovpn
# Данные для аутентификации задаются в разделе веб-интерфейса https://84.201.138.84/#/users
bastion_IP = 84.201.138.84 
someinternalhost_IP = 10.129.0.25


testapp_IP = 84.201.159.109
testapp_port = 9292

# Создание образа packer необходимо описать в файле .json (примиер packer/immutable.json) 
# Пример использования переменных для сборки образа - packer/variables.json.example
# Проверка сборки 

packer validate -var-file=variables.json ./immutable.json

# Запуск сборки 

packer build -var-file=variables.json ./immutable.json

# Пример скрипта для запсука ВМ из созданного образа - cofig-scripts/create-reddit-vm.sh 


# Описание основого инстанса 

terraform/main.tf

# Объявление input переменных

terraform/variables.tf

# Пример описанных input переменных 

terraform/terraform.tfvars.example

# Output переменные 

terraform/output.tf 

# Основные команды 
для планирования и применения инфраструктуры:

terraform plan\apply

для уничтожения 

terraform destroy