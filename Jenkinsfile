pipeline {
    agent any
	
	stages {
		
        	stage('checkout'){
              		steps {
         			git 'https://github.com/HarshithaC30/ITransform-JenkinsCiCd.git'      
        		}
              	}
		
		stage('Docker Build') {
  		    agent any
   		   steps {
     			   sh 'docker build -t abc11/test:latest . '
     			 }
   	 	}
		
		stage('Docker Push') {
      			agent any
      			steps {
        			withCredentials([usernamePassword(credentialsId: 'Dockerhub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
         			sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          			sh 'docker push abc11/test:latest'
        			}
      			}
		}
	}
	
}
