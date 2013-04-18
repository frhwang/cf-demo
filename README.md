# cf-demo

> Very simple **Cloud Foundry** demo for presentation at KOREN 2013

Translated in other languages:

- [Korean](README.ko.md)

## Overview

This project contains:

- Cloud Foundry VM setup tool (a.k.a `micro-cloud`)
- Cloud Foundry sample applications

## Setting up Cloud Foundry VM

### Prerequisite

- Download & Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) `4.2.10` or later (latest recommended)
- Download & Install [Vagrant](http://downloads.vagrantup.com/) `1.1.5` or later (latest recommended)
- Make sure `host only network` in VirtualBox

### Installing Cloud Foundry

1. Clone this project.

		$ git clone http://github.com/frhwang/cf-demo
	
2. Boot up VM.

		cf-demo $ vagrant up
	
3. Login to VM via SSH

		cf-demo $ vagrant ssh
	
4. When you login to VM for the first time, Installation is perfomed automatically. Wait for completion of installing. It takes very long time. (1 hour+)

5. Finally, you may see following messages.

		Deployment Info
		***************
		* Status: Success
		* Config files: /home/vagrant/cloudfoundry/.deployments/devbox/config
		* Deployment name: devbox
		* Note:
		  * If you want to run ruby/vmc please source the profile /home/vagrant/.cloudfoundry_deployment_profile
		  * If you want to run cloudfoundry components by hand please source the profile /home/vagrant/.cloudfoundry_deployment_local
		* Command to run cloudfoundry: /home/vagrant/cloudfoundry/vcap/dev_setup/bin/vcap_dev start
		
		vagrant@micro-cloud $

6. Now you can run Cloud Foundry.

		vagrant@micro-cloud $ cf start
		
7. Check status for components of Cloud Foundry.
		
		vagrant@micro-cloud $ cf status
		Targeting deployment "devbox" with cloudfoundry home "/home/vagrant/cloudfoundry"
		...		
		loud_controller               :	 RUNNING
		postgresql_node               :	 RUNNING
		mongodb_gateway               :	 RUNNING
		vblob_node                    :	 RUNNING
		mysql_node                    :	 RUNNING
		postgresql_gateway            :	 RUNNING
		uaa                           :	 RUNNING
		redis_node                    :	 RUNNING
		redis_gateway                 :	 RUNNING
		mysql_gateway                 :	 RUNNING
		dea                           :	 RUNNING
		stager                        :	 RUNNING
		mongodb_node                  :	 RUNNING
		rabbitmq_gateway              :	 RUNNING
		health_manager                :	 RUNNING
		vblob_gateway                 :	 RUNNING
		router                        :	 RUNNING
		rabbitmq_node                 :	 RUNNING
		
8. `cf` command is alias for Cloud Foundry launch script. It has some commands:

		vagrant@micro-cloud $ cf start|stop|restart|tail|status

9. Add following entry to your hosts file (e.g. /etc/hosts) in the `host machine` (not VM)

		127.0.0.1 api.vcap.me uaa.vcap.me
		

### Verifying VM

All of following instructions must be performed in your `host machine`.

1. Install Ruby 1.9.2 (Recommended Installer: [RVM](https://rvm.io/) or [rbenv](https://github.com/sstephenson/rbenv/))

2. Install RubyGems

3. Install VMC via RubyGems

		$ [sudo] gem install vmc

4. Register an account

		$ vmc target api.vcap.me
		$ vmc regster
	
5. Login to Cloud Foundry (installed in VM)

		$ vmc login
		
## License

(The MIT license)

Copyright (c) 2013 Hyunseok Hwang

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
