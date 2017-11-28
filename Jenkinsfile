node {
    // Clean workspace before doing anything
  

    try {
        stage ('Clone') {
            checkout scm         
        }
        stage ('Build') {
		try {
			bat "cd SQLSource \n ExecScripts.bat"
			def logX = readFile "${env.WORKSPACE}/SQLSource/errorX_logfile.txt"
			
			if(logX == '')
			echo " No Error log generated for script X"
			else
			throw err
			
			}
			catch(err){
			            echo "Error exists in  Git X Script, Marking build as unstable"
						currentBuild.result = "UNSTABLE"
			}
        try{
			def logY = readFile "${env.WORKSPACE}/SQLSource/errorY_logfile.txt"
			
			if (logY == '')
			echo "No Error Log generated for Script Y"
			else
			throw err
			}catch(err){
			echo "Error exists in Git Y Script, Marking build as unstable"
						currentBuild.result = "UNSTABLE"
			}
			
			try{
			def logZ = readFile "${env.WORKSPACE}/SQLSource/errorZ_logfile.txt"
			if(logZ == '')
			echo "No Error Log generated for Z"
			else 
			throw err
			
			
			}catch(err){
			
				echo "Error exists in Git Y Script, Marking build as unstable"
						currentBuild.result = "UNSTABLE"
			}
				
		
		}
       stage ('Tests') {
          
               def status = ""
            try{
              bat "java -jar target\\tafd.jar"
			  def out= "$JENKINS_HOME/jobs/$JOB_NAME/builds/${BUILD_NUMBER}"
				bat "cd $JENKINS_HOME/jobs/$JOB_NAME/builds/${BUILD_NUMBER} \n dir /b /a-d > tmp.txt"
				def files = readFile "$JENKINS_HOME/jobs/$JOB_NAME/builds/${BUILD_NUMBER}/tmp.txt"
				def temp="tmp.txt";
				bat "java -jar LogParser.jar $out temp.txt"
				status = readFile "$JENKINS_HOME/jobs/$JOB_NAME/builds/${BUILD_NUMBER}/result.txt"
								echo status

				if(status.contains('Unsuccessful')){
					echo status
					throw err 
					}
					}
					catch(err)
					{
					currentBuild.result='UNSTABLE'
					}
			          
        }
        stage ('Deploy') {
            //update dashboard
            echo "Needs to update Dashboard"
        }
    } catch (err) {
        currentBuild.result = 'FAILED'
       
    }
}
