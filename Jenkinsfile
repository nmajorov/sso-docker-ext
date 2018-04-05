

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
              submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/nmajorov/sso-custom-theme.git']]]
             )

      sh "pwd;ls -a"


     }//end of stage('prepare')

     stage('build') {

      sh "docker info"
           

     } //end stage build



}

//
//  openshiftBuild(buildConfig: 'nodejs-ex', showBuildLogs: 'true')
 // stage 'deploy'
 // openshiftDeploy(deploymentConfig: 'nodejs-ex')
