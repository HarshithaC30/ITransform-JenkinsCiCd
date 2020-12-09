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
		
		stage("Deploy to kubernetes"){
        		steps{
            			//kubernetesDeploy(kubeconfigId: 'kube',            

                		//configs: '*.yaml')
    
	    			sh "kubectl create -f pods.yaml"
 				sh "kubectl create -f service.yaml"
				
				sh "kubectl apply -f pods.yaml"
				sh "kubectl apply -f service.yaml"
				
   			}
    		}
		
	}
	
}
