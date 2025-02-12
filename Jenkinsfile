pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/PXXNNAN/Qa_Hive_API_Demo.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                bat 'npm install -g newman'
            }
        }
        stage('Run API Tests') {
            steps {
                bat 'newman run Qa_Hive_API_Demo.postman_collection.json --reporters cli,junit --reporter-junit-export results.xml'
            }
        }
        stage('Publish Test Report') {
            steps {
                junit 'results.xml'
            }
        }
    }
}
