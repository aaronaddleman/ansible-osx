# ansible-osx

Use ansible to configure the mac

Its best to fork this project and make it your own.

## preflight

### checklist

1. git tools installed
1. python pyenv or asdf
1. password for admin

## quick start

### setup

```shell
pip install ansible
ansible-galaxy install -r requirements.yml
```

### check

```shell
ansible-playbook -i "localhost," -c local ansible_osx.yml --ask-become-pass --check
```

### run

```shell
ansible-playbook -i "localhost," -c local ansible_osx.yml --ask-become-pass
```

