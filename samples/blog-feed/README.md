# Simple Blog Feed

## Overview

- Sinatra + RabbitMQ
- RabbitMQ Service required
- Deploy [Simple Notifiable Blog app](../notifiable-blog) FIRST!

## Deployment

	blog-feed $ vmc push
	Name> koren-blog-feed (or different name for dups)
		
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
	
	Creating koren-blog-feed... OK
	
	1: koren-blog-feed.cloudfoundry.com
	2: none
	Domain> koren-blog-feed.cloudfoundry.com
	
	Updating koren-blog-feed... OK
	
	Create services for application?> n
	
	Bind other services to application?> y
	
	1: blog-mq
	2: blog-db
	Which service?> 1
	
	Binding blog-mq to koren-blog-feed... OK
	Bind another service?> n
	
	Save configuration?> n
	
	Uploading koren-blog-feed... OK
	Starting koren-blog-feed... OK
	Checking koren-blog-feed...
	  0/1 instances: 1 starting
	  1/1 instances: 1 running
	OK
	blog-feed $

## Removing

	$ vmc delete koren-blog-feed
	Really delete koren-blog-feed?> y

	Deleting koren-blog-feed... OK