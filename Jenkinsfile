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
