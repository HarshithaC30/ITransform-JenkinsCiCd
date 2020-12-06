pipeline {
    agent any
	
	stages {
		
        	stage('checkout'){
              		steps {
         			git 'https://github.com/HarshithaC30/ITransform-JenkinsCiCd.git'      
        		}
              	}
		
		//stage('Docker Build') {
  		    //agent any
   		   //steps {
     			   //sh 'docker build -t hc0211/test:latest . '
     			 //}
   	 	//}
		
		//stage('Docker Push') {
      			//agent any
      			//steps {
        			//withCredentials([usernamePassword(credentialsId: 'docker-hub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
         			//sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          			//sh 'docker push hc0211/test:latest'
        			//}
      			//}
		//}
		
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
