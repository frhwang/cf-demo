# Simple Blog

## Overview

- Sinatra + MySQL(Cloud)/SQLite3(Local)
- MySQL Service required

## Deployment

	simple-blog $ vmc push
	Name> koren-blog (or different name for dups)
	
	Instances> 1
	
	1: sinatra
	2: other
	Framework> sinatra
	
	1: ruby18
	2: ruby19
	3: other
	Runtime> 2
	
	1: 64M
	2: 128M
	3: 256M
	4: 512M
	5: 1G
	Memory Limit> 128M
	
	Creating koren-blog... OK
	
	1: koren-blog.cloudfoundry.com
	2: none
	Domain> koren-blog.cloudfoundry.com
	
	Updating koren-blog... OK
	
	Create services for application?> y
	
	1: mongodb 2.0
	2: mysql 5.1
	3: postgresql 9.0
	4: rabbitmq 2.4
	5: redis 2.2
	6: redis 2.4
	7: redis 2.6
	What kind?> 2
	
	Name?> blog-db
	
	Creating service blog-db... OK
	Binding blog-db to koren-blog... OK
	Create another service?> n
	
	Bind other services to application?> n
	
	Save configuration?> n
	
	Uploading koren-blog... OK
	Starting koren-blog... OK
	Checking koren-blog...
	  0/1 instances: 1 starting
	  0/1 instances: 1 starting
	  1/1 instances: 1 running
	OK
	simple-blog $

## Removing

	$ vmc delete koren-blog
	Really delete koren-blog?> y
	
	Deleting koren-blog... OK
	
	Delete orphaned service blog-db?> y
	
	Deleting blog-db... OK