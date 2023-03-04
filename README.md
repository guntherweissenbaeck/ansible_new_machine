## Vorarbeiten
```console
sudo apt update && sudo apt install -y git ansible
```

## Benutzer hinzufügen
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

## Ziel
```console
curl https://github.com/guntherweissenbaeck/ansible_new_machine/start | sudo bash
```
