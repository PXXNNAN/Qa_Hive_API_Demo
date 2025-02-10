pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/PXXNNAN/Qa_Hive_API_Demo.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                sh 'npm install -g newman'
            }
        }
        stage('Run API Tests') {
            steps {
                sh 'newman run Qa_Hive_API_Demo.postman_collection.json --reporters cli,junit --reporter-junit-export results.xml'
            }
        }
        stage('Publish Test Report') {
            steps {
                junit 'results.xml'
            }
        }
    }
}
