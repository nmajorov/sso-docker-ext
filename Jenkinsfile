

/**
 * simple jenkins pipeline  change redhat sso image
 *
 **/

node {

     

    //check if project exist
     stage('prepare') {

      sh "oc project sso-build"

      

       checkout([$class: 'GitSCM', branches: [[name: '*/master']], 
               doGenerateSubmoduleConfigurations: false, extensions: [], 
              submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/nmajorov/sso-docker-ext.git']]]
             )

      sh "mkdir -p themes"
      checkout([$class: 'GitSCM', branches: [[name: '*/master']], 
               doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'RelativeTargetDirectory', 
            relativeTargetDir: 'themes/rh-sso']], 
              submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/nmajorov/sso-custom-theme.git']]]
             )

      sh "pwd;ls -a"

      //use latest sso image 
      sh "oc import-image my-redhat-sso-7/sso72-openshift --from=registry.access.redhat.com/redhat-sso-7/sso72-openshift --confirm"


     }//end of stage('prepare')

     stage('build') {
         println("start build image")

         def output = sh(script: 'echo $(oc delete all  -l app=sso72 2>&1)', returnStdout: true)

         println("command output: $output")

        //wait unitl delete is done
        // wait 3 min for finish clean up
        for (i = 0; i <3; i++) {
            sleep 60 //sleep a minute
            String status = sh(script: 'echo $(oc get svc/sso72 2>&1)', returnStdout: true)
            println("status: $status")

            if (status.contains("NotFound")){
               break
            }else {
                println("waiting until delete is finished")
                if(i == 2){
                    println("delete takes too long check openshift events ")
                    exit 1
                }
            }//if (!status.contains("NotFound"))

        }//end for


         sh "rm -fr .git themes/rh-sso/.git" 

         sh " oc new-app --code=. --strategy=docker --name=sso72"
         sh "oc start-build --from-dir=. sso72"
         sh "oc expose service sso72"

     } //end stage build


    deleteDir() //optionally clean up space
}

//
//  openshiftBuild(buildConfig: 'nodejs-ex', showBuildLogs: 'true')
 // stage 'deploy'
 // openshiftDeploy(deploymentConfig: 'nodejs-ex')
