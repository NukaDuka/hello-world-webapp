pipeline {
    agent any
    tools {
        dockerTool "docker"
    }
    stages {
        stage('Build') {
            steps {
                script {
                    image = docker.build("nukaduka1/hello-world-webapp")
                }
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker login; docker push nukaduka1/hello-world-webapp:latest'
            }
        }
    }
    post {
        always {
            echo """{"project_name": "$JOB_NAME", "build_commit": "$env.GIT_COMMIT", "build_number": "$env.BUILD_NUMBER",  "status": "FAILURE"}"""
        }
        success {
            httpRequest customHeaders: [[maskValue: false, name: 'Content-Type', value: 'application/json']], httpMode: 'POST', requestBody: "{'project_name': '$JOB_NAME', 'build_commit': '$env.GIT_COMMIT', 'build_number': '$env.BUILD_NUMBER',  'status': 'SUCCESS'}", responseHandle: 'NONE', url: 'https://api.flock.com/hooks/sendMessage/t0t4l1y-r3a1-ur1-n1c3-trym4t3', wrapAsMultipart: false
        }
        failure {
            httpRequest customHeaders: [[maskValue: false, name: 'Content-Type', value: 'application/json']], httpMode: 'POST', requestBody: "{'project_name': '$JOB_NAME', 'build_commit': '$env.GIT_COMMIT', 'build_number': '$env.BUILD_NUMBER',  'status': 'FAILED'}", responseHandle: 'NONE', url: 'https://api.flock.com/hooks/sendMessage/t0t4l1y-r3a1-ur1-n1c3-trym4t3', wrapAsMultipart: false
        }
    }
}
