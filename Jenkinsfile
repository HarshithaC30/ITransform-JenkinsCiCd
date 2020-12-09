pipeline {
    agent any
	
	stages {
		
        	stage('checkout'){
              		steps {
         			git 'https://github.com/HarshithaC30/ITransform-JenkinsCiCd.git'      
        		}
              	}
		
		//stage('Compile') {
         		//steps {
            			// Get some code from a GitHub repository 
            			//git 'https://github.com/HarshithaC30/ITransform-JenkinsCiCd.git'
            			//sh "mvn clean compile"
         		//}
         	//}
		
		//stage("Mvn install") {
         		 //steps {
            			//git 'https://github.com/HarshithaC30/ITransform-JenkinsCiCd.git'  
            			//sh "mvn clean install"
            		 //}
       		//}
		
		stage('Docker Build') {
   			agent any
      			steps {
       				sh 'docker build . -t hc0211/test:latest'
      			}
    		}
		
    		//stage('Docker Push') {
     			//steps {
      				//withCredentials([usernamePassword(credentialsId: 'Dockerhub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
       				//sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
       				//sh 'docker push app1/test:latest'
        			//}
     			//}
   		//}
		stage('Docker Push') {
     			steps {
    				withCredentials([usernamePassword( credentialsId: 'Dockerhub', usernameVariable: 'USER', passwordVariable: 'PASSWORD')]) {
        
        			sh "docker login -u $USER -p $PASSWORD"
					
           			sh 'docker push hc0211/test:latest'
        			}
    			}
		}
		
		stage("Deploy to kubernetes"){
        		steps{
            			kubernetesDeploy(kubeconfigId: 'kube',            

                		configs: '*.yaml')
    
	    			sh "kubectl create -f pods.yaml"
 				sh "kubectl create -f service.yaml"
				
				sh "kubectl apply -f pods.yaml"
				sh "kubectl apply -f service.yaml"
				
   			}
    		}
		
	}
	
}
