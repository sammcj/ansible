#### Install Ansible

Mac:
```
brew install ansible
```

Linux:
```
sudo easy_install pip
sudo pip install ansible
```

#### Run Playbook

```
ansible-galaxy install -r requirements.yml
ansible-playbook -i hosts site.yml --skip-tags osx
```
...or just `deploy.sh`

#### Local OSX Build
```
ansible-playbook -i hosts site.yml --tags osx
```

#### Just start Docker apps
```
./start_docker_apps.sh
```

#### Tutorials

* http://docs.ansible.com/playbooks_best_practices.html
* http://docs.ansible.com/playbooks.html
* http://www.nickhammond.com/automating-development-environment-ansible/
* https://www.digitalocean.com/community/tutorials/how-to-create-an-ansible-playbook-to-automate-drupal-installation-on-ubuntu-14-04
* https://galaxy.ansible.com/list#/roles

#### Packages

* http://docs.ansible.com/apt_module.html
* http://docs.ansible.com/git_module.html

#### Files

* http://docs.ansible.com/copy_module.html
* http://docs.ansible.com/file_module.html
* http://docs.ansible.com/template_module.html
* http://docs.ansible.com/get_url_module.html

#### Templates

* http://jinja.pocoo.org/docs/dev/
* http://docs.ansible.com/template_module.html

#### Exec

* http://docs.ansible.com/command_module.html
* http://docs.ansible.com/script_module.html
* http://docs.ansible.com/cron_module.html

#### Docker / Virt

* http://docs.ansible.com/docker_module.html
* http://docs.ansible.com/virt_module.html
* https://github.com/nacerix/debian-docker

#### Security

* http://docs.ansible.com/authorized_key_module.html

#### Other
* http://docs.ansible.com/list_of_all_modules.html
* http://docs.debops.org/en/latest/index.html
* http://docs.ansible.com/service_module.html
* http://jamie.ideasasylum.com/2014/08/ansible-syntax-highlighting-sublime/
* https://www.packer.io/docs/provisioners/ansible-local.html
* http://shankerbalan.net/blog/applying-xenserver-hotfixes-with-ansible/
* https://github.com/shankerbalan/ansible/tree/master/xenserver

##### Example

```
samm-mbp ~/git/ansible % ./run.sh

PLAY [nas] ********************************************************************

GATHERING FACTS ***************************************************************
ok: [192.168.0.43]

TASK: [debian | Install base packages] ****************************************
ok: [192.168.0.43] => (item=git,vim,htop,curl,ncdu,axel,shorewall,rsync,unrar,unzip,tmux,supervisor,sudo,bzip2,fio,deborphan,hdparm,iftop,iotop,vim-syntax-docker,unattended-upgrades,mtr)

TASK: [libvirt | Install base packages] ***************************************
ok: [192.168.0.43] => (item=qemu-kvm,qemu-utils,libvirt-bin,libvirt-clients,python-libvirt,libvirt0,libvirt-daemon)

TASK: [nginx | Installs nginx] ************************************************
ok: [192.168.0.43] => (item=nginx-full)

TASK: [build | Install general build packages] ********************************
ok: [192.168.0.43] => (item=build-essential,make,g++,gcc)

PLAY RECAP ********************************************************************
192.168.0.43               : ok=5    changed=0    unreachable=0    failed=0
```

#### Structure
###### Files
```
site.yml
webservers.yml
fooservers.yml
roles/
   common/
     files/
     templates/
     tasks/main.yml
     handlers/
     vars/
     defaults/
     meta/
   webservers/
     files/
     templates/
     tasks/main.yml
     handlers/
     vars/
     defaults/
     meta/
```
###### Playbook
```
---
- hosts: webservers
  roles:
     - common
     - webservers
```
