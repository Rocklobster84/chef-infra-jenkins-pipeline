pipeline {
    agent {
        label "agentfarm"
    }
    stages {
        stage('Delete the workspace') {
            steps {
                cleanWs()
            }
        }
        stage('Install Chef Workstation') {
            steps {
                sh 'sudo apt-get install -y wget tree unzip'
                sh ' wget https://packages.chef.io/files/stable/chef-workstation/21.8.555/ubuntu/20.04/chef-workstation_21.8.555-1_amd64.deb'
                sh 'sudo dpkg -i chef-workstation_21.8.555-1_amd64.deb'
                sh 'sudo chef env --chef-license accept'
            }
        }
        stage('Third Stage') {
            steps {
                echo "Third Stage"
            }
        }
    }
}