node {
    // Clean workspace before doing anything
  

    try {
        stage ('Clone') {
            checkout scm
            
        }
        stage ('Build') {
		try {


			echo "${BUILD_NUMBER}"
			echo "${env.WORKSPACE}"
			bat "cd SQLSource \n ExecScripts.bat"
			
			def logX = readFile "${env.WORKSPACE}/SQLSource/errorX_logfile.txt"
			def logY = readFile "${env.WORKSPACE}/SQLSource/errorY_logfile.txt"
			def logZ = readFile "${env.WORKSPACE}/SQLSource/errorZ_logfile.txt"
			
			if(logX == '')
			echo " No Error log generated for script X"
			else
			throw err
			
			if (logY == '')
			echo "No Error Log generated for Script Y"
			else
			throw err
			
			if(logZ == '')
			echo "No Error Log generated for Z"
			else 
			throw err
			
			}
			catch(err){
			            echo "Error exists in Git Scripts, Marking build as unstable"
						currentBuild.result = "UNSTABLE"
			}
        }
       stage ('Tests') {
            parallel 'static': {
                bat "echo 'shell scripts to run static tests...'"
            },
            'unit': {
                bat "java -jar target\\tafd.jar"
				def out= "$JENKINS_HOME/jobs/$JOB_NAME/builds/${BUILD_NUMBER}"
				echo out
				
			
            },
            'integration': {
                bat "echo 'shell scripts to run integration tests...'"
            }
        }
        stage ('Deploy') {
            //update dashboard
            bat "echo 'shell scripts to deploy to server...'"
        }
    } catch (err) {
        currentBuild.result = 'FAILED'
        throw err
    }
}
