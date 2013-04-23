# Simple Web Page

## Overview

- Sinatra
- No service required

## Deployment

	simple-page $ vmc push
	Name> koren-page (or defferent name for dups)
		
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
	6: 2G
	Memory Limit> 128M
	
	Creating koren-page... OK

	1: koren-page.cloudfoundry.com
	2: none
	Domain> koren-page.cloudfoundry.com
	
	Updating koren-page... OK

	Create services for application?> n

	Save configuration?> n
	
	Uploading koren-page... OK
	Starting koren-page... OK
	Checking koren-page...
	  0/1 instances: 1 starting
	  1/1 instances: 1 running
	OK
	simple-page $

## Removing

	$ vmc delete koren-page
	Really delete koren-page?> y

	Deleting koren-page... OK
