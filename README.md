# Ansible mit neuer Linux-Maschine
 Using Ansible to automate your Linux-Machine configs! 

## 	Preparations
```console
sudo apt update && sudo apt install -y git ansible
```

## Adding the user
```console
adduser gw
```

## Sudo
```console
usermod -aG sudo gw
```

## Ansible Pull
```console
sudo ansible-pull -U https://github.com/guntherweissenbaeck/ansible_new_machine.git
```

## Goal
```console
curl https://github.com/guntherweissenbaeck/ansible_new_machine/start | sudo bash
```
