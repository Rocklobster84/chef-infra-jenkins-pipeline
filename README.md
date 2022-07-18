# Overview

Every Chef Infra installation needs a Chef Repository. This is the place where cookbooks, policyfiles, config files and other artifacts for managing systems with Chef Infra will live. 

This Chef Repo contains cookbooks that install apache and the Jenkins agent.

## Repository Directories

This repository contains several directories, and each directory contains a README file that describes what it is for in greater detail, and how to use it for managing your systems with Chef.

- `cookbooks/` - Cookbooks you download or create.
- `data_bags/` - Store data bags and items in .json in the repository.
- `policyfiles/` - Stores policyfiles for each included cookbook.

## Configuration

The config file, `.chef/config.rb` is a repository-specific configuration file for the knife command line tool. If you're using the Hosted Chef platform, you can download one for your organization from the management console. You can also generate a new config.rb by running `knife configure`. For more information about configuring Knife, see the Knife documentation at https://docs.chef.io/workstation/knife/

## Setup and Config Steps for project demo

1.	Create instance for Infra Server/Automate – install and setup workstation, infra server, and automate or look for AMI/Use Terraform.
2.	Create Jenkins controller – use Jenkins AMI
3.	Create instance for nginx node
4.	Clone GitHub Repo to instance that contains infra server
5.	Manually install policy files, set policy group for both NGINX node 
6.	Bootstrap nginx from infra instance using policy name and group
7.	Configure Jenkins Controller – default initial credentials username: admin, password should be located at /var/lib/jenkins/secrets/initialAdminPassword
8.	Be sure to use http not https when going to Jenkins GUI, cannot be opened in Google Chrome
9.	Sign in, got to Configure Jenkins, add the agent node
10.	Create credentials in Jenkins to grant access to GitHub repo, Manage Jenkins -> Manage Credentials. Under Credentials -> Stores scoped to Jenkins look for item named Jenkins with ‘global’ to the right of it. Hover over global and dropdown will appear. Click ‘Add credentials’. Kind will be SSH Username with Private key. Scope: Global. ID: git-repo-creds. Username: your git username. Private key: Private key from GitHub credentials. No passphrase. 
11.	Create pipeline in Jenkins GUI. Create Pipeline Project -> Definition: Pipeline script from SCM, SCM: Git, Repo URL: cookbook url, Credentials: Git credentials created previously. Branch: Master or Main etc. leave the rest as default options. Manually click build to test pipeline.
12.	Set up build trigger in Jenkins. In pipeline project config, under ‘Build Triggers’, check ‘GitHub hook trigger for GITScm polling’. In GitHub repo, go to ‘Settings’ -> Webhooks – Add webhook. Payload URL: http://jenkinurl:8080/github-webhook . Leave the rest as is. 
13.	Test by making change to a file. Push to GitHub. Jenkins build should run automatically. 
14.	Open Automate, Infrastructure -> Chef Infra Servers -> Add infra server. 
15.	In Automate, Compliance -> Scan Jobs -> Nodes -> add nginx node.
16.	In profiles, Upload latest nginx inspec profile. 
17.	Create Scan job for nginx node.
