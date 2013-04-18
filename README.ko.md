# cf-demo

> 아주 간단한 **Cloud Foundry** 시연 (KOREN 2013 세션 발표용)

Translated in other languages:

- [English](README.md)

## 개요

이 프로젝트에는 다음과 같은 자료들이 포함되어 있습니다:

- Cloud Foundry VM 설정 도구 (일명 `micro-cloud`)
- Cloud Foundry 샘플 애플리케이션

## Cloud Foundry VM 설치

### 사전 요구 사항

- [VirtualBox](https://www.virtualbox.org/wiki/Downloads) `4.2.10` 이상 설치 (최신 버전 권장)
- [Vagrant](http://downloads.vagrantup.com/) `1.1.5` 이상 설치 (최신 버전 권장)
- VirtualBox에 `호스트 전용 네트워크(host only network)` 설정 확인

### 설치

1. 본 프로젝트를 받습니다.

		$ git clone http://github.com/frhwang/cf-demo
	
2. VM을 기동합니다.

		cf-demo $ vagrant up
	
3. SSH를 통해 VM에 로그인 합니다.

		cf-demo $ vagrant ssh
	
4. 처음으로 VM에 로그인하면 설치가 자동으로 수행됩니다. 설치 완료될 때 까지 기다립니다. (꽤 오래 걸림, 1시간 이상)

5. 설치가 완료되면 아래와 같은 메시지를 확인할 수 있습니다. 

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

6. 이제 Cloud Foundry를 실행해 볼 수 있습니다.

		vagrant@micro-cloud $ cf start
		
7. Cloud Foundry가 잘 실행되었는지 확인해 봅니다.
		
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
		
8. `cf` 명령은 Cloud Foundry 실행 스크립트의 별명(alias)이며, 다음과 같은 명령을 포함하고 있습니다.

		vagrant@micro-cloud $ cf start|stop|restart|tail|status

9. `호스트 컴퓨터`의 hosts 파일에 다음 줄을 추가해 줍니다. (VM이 아님에 주의)

		127.0.0.1 api.vcap.me uaa.vcap.me
		
### VM 설치 상태 확인

`호스트 컴퓨터`에서 다음을 수행합니다.

1. Ruby 1.9.2를 설치합니다. ([RVM](https://rvm.io/) 혹은 [rbenv](https://github.com/sstephenson/rbenv/)를 이용한 설치 추천)

2. RubyGems를 설치합니다.

3. RubyGems를 통해 VMC를 설치합니다.

		$ [sudo] gem install vmc

4. Cloud Foundry에 계정을 등록합니다.

		$ vmc target api.vcap.me
		$ vmc regster
	
5. Cloud Foundry에 로그인합니다.

		$ vmc login
		
## 라이선스

(The MIT license)

Copyright (c) 2013 Hyunseok Hwang

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
