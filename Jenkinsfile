node {
    // Clean workspace before doing anything
  

    try {
        stage ('Clone') {
            checkout scm
            
        }
        stage ('Build') {
		try {
            bat "cd SQLSource \n ExecScripts.bat"
			}
			catch(err){
			            echo "Optional tests failed... don't propagate failure"
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
