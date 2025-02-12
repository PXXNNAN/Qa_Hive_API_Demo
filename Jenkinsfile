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
                bat 'npm install -g newman newman-reporter-html'
            }
        }
        stage('Run API Tests') {
            steps {
                bat 'newman run Qa_Hive_API_Demo.postman_collection.json --reporters cli,junit,html --reporter-junit-export results/results.xml --reporter-html-export results/newman-report.html'
            }
        }
        stage('Publish Test Report') {
            steps {
                junit 'results/results.xml'
                publishHTML(target: [
                    reportDir: 'results',
                    reportFiles: 'newman-report.html',
                    reportName: 'Newman Test Report'
                ])
            }
        }
    }
}
