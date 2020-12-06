pipeline {
    agent any
	
	stages {
		
        	stage('checkout'){
              		steps {
         			git 'https://github.com/HarshithaC30/ITransform-JenkinsCiCd.git'      
        		}
              	}
		
		stage('Build Project') {
         		steps {
            			// Get some code from a GitHub repository 
            			//git 'https://github.com/HarshithaC30/ITransform-JenkinsCiCd.git'
            			sh "mvn clean compile"
         		}
         	}
		
		stage("Deploy") {
         		 steps {
            			git 'https://github.com/HarshithaC30/ITransform-JenkinsCiCd.git'  
            			sh "mvn clean install"
            		 }
       		}
		
	}
	
}
