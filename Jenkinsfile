pipeline {
    agent any

    stages {
        stage('Retrieve') {
            steps {
                sh 'cd /tmp; git clone https://github.com/NukaDuka/hello-world-webapp/' 
            }
        }
        stage('Build') {
            steps {
                sh 'cd /tmp; docker build . -t test_webapp'
                httpRequest consoleLogResponseBody: true, customHeaders: [[maskValue: false, name: 'Content-Type', value: 'application/json']], httpMode: 'POST', requestBody: '''{
"text": "Project name: hello-world-webapp , Build commit: $(GIT_COMMIT), Build status: SUCCESS"
}''', responseHandle: 'NONE', url: 'https://api.flock.com/hooks/sendMessage/31e870cf-0a95-42be-85bd-c0a27f335958', wrapAsMultipart: false
            }
        }
    }
}
