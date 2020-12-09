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
		
		stage('Docker Build') {
   			agent any
      			steps {
       				sh 'docker build -t app1/test:latest . '
      			}
    		}
		
    		stage('Docker Push') {
     			agent any
     			steps {
      				withCredentials([usernamePassword(credentialsId: 'Dockerhub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
       				sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
       				sh 'docker push app1/test:latest'
        			}
     			}
   		}
		
		stage("Deploy to kubernetes"){
        		steps{
            			kubernetesDeploy(kubeconfigId: 'kube',            

                		configs: '*.yaml')
    
	    			sh "kubectl create -f pods.yaml"
 				sh "kubectl create -f service.yaml"
				
				//sh "kubectl apply -f pods.yaml"
				//sh "kubectl apply -f service.yaml"
				
   			}
    		}
		
	}
	
}
