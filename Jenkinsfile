pipeline {
    agent any
    environment {
        PROJECT_ID = 'crucial-bucksaw-407710'
        CLUSTER_NAME = 'aqpgkecluster'
        LOCATION = 'us-central1-c'
        CREDENTIALS_ID = 'CREDENTIALS_ID'
    }
   
    stages {
        stage('pull from github repo'){
            steps{
                git "https://github.com/Charuchandra-12/Deploy-Anime-Quotes-App-To-GKE.git"
            }
        }
        stage('build docker image'){
            steps{
                sh "docker build -t chinmaykubal/animequotesapp:${env.BUILD_ID} ."                
            }
        }
        stage('push docker image to dockerhub'){
            steps{
                withCredentials([string(credentialsId: 'DOCKER_PASS', variable: 'docker_pass')]) {
                    sh "docker login -u chinmaykubal -p ${docker_pass}"
                }
                sh "docker push chinmaykubal/animequotesapp:${env.BUILD_ID}"
            }
            
        }
        stage('Deploy to GKE') {
            steps{
                sh "sed -i 's/tagversion/${env.BUILD_ID}/g' deployment.yaml"
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