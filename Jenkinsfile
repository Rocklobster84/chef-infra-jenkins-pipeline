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
        stage('Trust git') {
            steps {
                sh 'git config --global --add safe.directory /opt/jenkins/workspace/chef-pipeline'
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
                sh 'cd /opt/jenkins/workspace/chef-pipeline/cookbooks/apache/ && sudo kitchen destroy'
            }
        }
        stage('Run Kitchen Create') {
            steps {
                sh 'cd /opt/jenkins/workspace/chef-pipeline/cookbooks/apache/ && sudo kitchen create'
            }
        }
        stage('Run Kitchen Converge') {
            steps {
                sh 'cd /opt/jenkins/workspace/chef-pipeline/cookbooks/apache/ && sudo git config --global --add safe.directory /opt/jenkins/workspace/chef-pipeline && sudo kitchen converge'
            }
        }
        stage('Run Kitchen Verify') {
            steps {
                sh 'cd /opt/jenkins/workspace/chef-pipeline/cookbooks/apache/ && sudo kitchen verify'
            }
        }
        stage('Kitchen Destroy') {
            steps {
                sh 'cd /opt/jenkins/workspace/chef-pipeline/cookbooks/apache/ && sudo kitchen destroy'
            }
        }
        stage('Slack Notification') {
            steps {
                slackSend color: 'warning', message: "Stephanie: Please approve ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.JOB_URL} | Open>)"
            }
        }
        stage('Request Input'){
            steps {
                input 'Please approve or deny this build'
            }
        }
    }
    post {
        success {
            slackSend color: 'warning', message: "${env.JOB_NAME} ${env.BUILD_NUMBER Successful!"
    }
        failure {
            slackSend color: 'warning', message: "${env.JOB_NAME} ${env.BUILD_NUMBER} Failed!"
    }   
  }
}