pipeline {
    agent any
	
	stages {
		
        	stage('checkout'){
              		steps {
         			git 'https://github.com/HarshithaC30/ITransform-JenkinsCiCd.git'      
        		}
              	}
		
		stage('Build image') {
         		steps {
            			app = docker.build("abc11/app")
         		}
         	}
		
		stage("Push image") {
         		 steps {
            			docker.withRegistry('https://registry.hub.docker.com', 'docker-hub') {
            			app.push("${env.BUILD_NUMBER}")
            			app.push("latest")
            			} 
                		echo "Trying to Push Docker Build to DockerHub"
            		 }
       		}
		
	}
	
}
