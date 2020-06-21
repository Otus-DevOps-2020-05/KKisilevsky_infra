# KKisilevsky_infra
KKisilevsky Infra repository

# Bastion host SSH forwarding with alias for destination host
# First of all, you need to create ssh keys between hosts
# edit ssh config file

nano ~/.ssh/config

# 84.201.138.84 - Bastion Host, 10.129.0.25 - Internal host

Host    84.201.138.84
        ForwardAgent yes

Host    someinternalhost
        Hostname 10.129.0.25
        User kkisilevsky
        ProxyCommand ssh -A kkisilevsky@84.201.138.84 -W %h:%p
