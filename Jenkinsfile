pipeline {
    agent any
    environment {
        PROJECT_ID = '<YOUR_PROJECT_ID>'
        CLUSTER_NAME = '<YOUR_CLUSTER_NAME>'
        LOCATION = '<YOUR_CLUSTER_LOCATION>'
        CREDENTIALS_ID = '<YOUR_CREDENTIAS_ID>'
    }
   
    stages {
        stage('pull from github repo'){
            steps{
                git "https://github.com/Charuchandra-12/Deploy-Anime-Quotes-App-To-GKE.git"
            }
        }
        stage('build docker image'){
            steps{
                sh "docker build -t chinmaykubal/animequotesapp:latest ."                
            }
        }
        stage('push docker image to dockerhub'){
            steps{
                withCredentials([string(credentialsId: 'DOCKER_PASS', variable: 'docker_pass')]) {
                    sh "docker login -u chinmaykubal -p ${docker_pass}"
                }
                sh "docker push chinmaykubal/animequotesapp:latest"
            }
            
        }
        stage('Deploy to GKE') {
            steps{
                step([
                $class: 'KubernetesEngineBuilder',
                projectId: env.PROJECT_ID,
                clusterName: env.CLUSTER_NAME,
                location: env.LOCATION,
                manifestPattern: 'deployment.yaml',
                credentialsId: env.CREDENTIALS_ID,
                verifyDeployments: true])
            }
        }
     
}
}