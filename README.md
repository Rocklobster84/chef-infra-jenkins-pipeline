# Overview

Every Chef Infra installation needs a Chef Repository. This is the place where cookbooks, policyfiles, config files and other artifacts for managing systems with Chef Infra will live. 

This Chef Repo contains cookbooks that install apache and the Jenkins agent.

## Repository Directories

This repository contains several directories, and each directory contains a README file that describes what it is for in greater detail, and how to use it for managing your systems with Chef.

- `cookbooks/` - Cookbooks you download or create.
- `data_bags/` - Store data bags and items in .json in the repository.
- `policyfiles/' - Stores policyfiles for each included cookbook.

## Configuration

The config file, `.chef/config.rb` is a repository-specific configuration file for the knife command line tool. If you're using the Hosted Chef platform, you can download one for your organization from the management console. You can also generate a new config.rb by running `knife configure`. For more information about configuring Knife, see the Knife documentation at https://docs.chef.io/workstation/knife/

## Next Steps

Read the README file in each of the subdirectories for more information about what goes in those directories.
