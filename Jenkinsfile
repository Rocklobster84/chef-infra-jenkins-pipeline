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
                        echo "Skip - Workstation already installed"
                    } else {
                        sh 'sudo apt-get install -y wget tree unzip'
                        sh ' wget https://packages.chef.io/files/stable/chef-workstation/21.8.555/ubuntu/20.04/chef-workstation_21.8.555-1_amd64.deb'
                        sh 'sudo dpkg -i chef-workstation_21.8.555-1_amd64.deb'
                        sh 'sudo chef env --chef-license accept'
                    }
                }
            }
        }
        stage('DL Cookbooks') {
            steps {
                git branch: 'main', credentialsId: 'git-repo-creds', url: 'git@github.com:Rocklobster84/chef-infra-jenkins-pipeline.git'
            }
        }
        stage('Install Kitchen Docker Gem') {
            steps {
                script {
                    def exists = fileExists '/opt/docker'
                    if (exists == true) {
                        echo "Skip - kitchen-docker already installed"
                    } else {
                        sh 'sudo apt-get install -y make gcc'
                        sh 'sudo chef gem install kitchen-docker'
                    }
                }
            }
        }
        // Test Apache cookbook
        stage('Run Kitchen Destroy') {
            steps {
                sh 'cd cookbooks/apache'
                sh 'sudo kitchen destroy'
            }
        }
        stage('Run Kitchen Create') {
            steps {
                sh 'sudo kitchen create'
            }
        }
        stage('Run Kitchen Converge') {
            steps {
                sh 'sudo kitchen converge'
            }
        }
        stage('Run Kitchen Verify') {
            steps {
                sh 'sudo kitchen verify'
            }
        }
        stage('Kitchen Destroy') {
            steps {
                sh 'sudo kitchen destroy'
            }
        }
    }
}