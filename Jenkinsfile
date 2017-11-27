node {
    // Clean workspace before doing anything
  

    try {
        stage ('Clone') {
            checkout scm
            
        }
        stage ('Build') {
		try {
            bat "cd SQLSource \n ExecScripts.bat"
			def version = readFile "${env.WORKSPACE}/SQLSource/error_logfile.txt"
			echo " OUTPUTTING FILE CONTENTS"
			echo "${env.WORKSPACE}"
			
			if(version == '')
			echo " No Error log generated for script"
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
