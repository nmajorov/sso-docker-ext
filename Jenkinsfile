

/**
 * simple jenkins pipeline for nodejs application
 */

node {

     def NODE_PROJECT_EXIST = false


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

      


     }//end of stage('prepare')

     stage('build') {
         println("start build image")

        def output = sh(script: 'echo $(oc delete all  -l app=sso72 2>&1)', returnStdout: true)

         println("command output: $output")

         sh "rm -fr .git themes/rh-sso/.git" 

         sh " oc new-app --code=. --strategy=docker --name=sso72"
         sh "oc new-app --code=.  --strategy=docker --name=sso72"
         sh "oc start-build --from-dir=. sso72"
         sh "oc expose service sso72"

     } //end stage build



}

//
//  openshiftBuild(buildConfig: 'nodejs-ex', showBuildLogs: 'true')
 // stage 'deploy'
 // openshiftDeploy(deploymentConfig: 'nodejs-ex')
