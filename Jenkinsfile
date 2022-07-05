pipeline {
    agent {
        label "agentfarm"
    }
    stages {
        stage('Delete workspace') {
            steps {
                cleanWs()
            }
        }
        stage('Install Chef Workstation') {
            steps {
                script {
                    def exists = fileExists '/usr/bin/chef-client'
                    if (exists == true) {
                        echo "Skipping - Workstation already installed"
                    } else {
                        sh 'sudo apt-get install -y wget tree unzip'
                        sh ' wget https://packages.chef.io/files/stable/chef-workstation/21.8.555/ubuntu/20.04/chef-workstation_21.8.555-1_amd64.deb'
                        sh 'sudo dpkg -i chef-workstation_21.8.555-1_amd64.deb'
                        sh 'sudo chef env --chef-license accept'
                    }
                }
            }
        }
        stage('DL Apache Cookbook') {
            steps {
                git branch: 'main', credentialsId: 'git-repo-creds', url: 'git@github.com:Rocklobster84/chef-infra-jenkins-pipeline.git'
            }
        }
    }
}