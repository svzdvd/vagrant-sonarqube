# SonarQube Server with MySQL

This repository uses Vagrant and Chef to install [SonarQube](http://www.sonarqube.org/) onto a 
local virtual machine. It also installs MySQL as the database for SonarQube.

## Prerequisites

You must installed on your host machine:

1. [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. [Vagrant](https://www.vagrantup.com/downloads.html)
3. [Berkshelf](http://berkshelf.com/)
4. [vagrant-berfkshelf plugin](https://github.com/berkshelf/vagrant-berkshelf)

## Using SonarQube

To start the virtual machine, run the following command:

`vagrant up`

You can access SonarQube at [http://192.168.111.222:9000](http://192.168.111.222:9000)

**Note:** After the very first time running this command, the server may not start correctly. Run
 `vagrant reload` to restart the VM, and the server should start normally.

## Configure Sonar Scanner

To have [SonarQube scanner](http://docs.sonarqube.org/display/SONAR/Installing+and+Configuring+SonarQube+Scanner)
use this server, provide the following configuration in your project's (or global) 
`sonar-runner.properties` file:

```
sonar.host.url = "http://192.168.111.222:9000"
sonar.login = "admin"
sonar.password = "admin"
```

## Chef Provisioning

This repository uses Chef Solo to provision the Vagrant-managed virtual machine. It uses 
Berkshelf to pull in community cookbooks for SonarQube, MySQL, Java, and more.
