# Build custom docker sso72 image

## Build locally with docker

run command to build locally:

        ./build_local.sh


test/run locally:


            docker run --rm -ti -p 8080:8080  ch/sso72


go to url [http://localhost:8080](http://localhost:8080)

username: admin password: Sion2018!


## Build on openshift


1. Create new-project


        oc new-project sso-build

2. create new pipeline strategy project with command


        oc new-app git@github.com:nmajorov/sso-docker-ext.git   --name=jenkins --strategy=pipeline

for my custom repo deployment I have to create secrets first:

Create secret to pull from registry:

        oc secrets new-basicauth gitsecret \
        --username=$GIT_USER \
        --password=$GIT_PASSWORD \
        --gitconfig=.gitconfig

then run command:


        GIT_SSL_NO_VERIFY=true oc new-app https://gogs.app.niko-cloud.ch/niko/sso72 --strategy=docker --source-secret=gitsecret

        


## Tips

git option to ignore self-signet certificate:

        git config http.sslVerify "false"

set username and stop ask password for 1800 sec:


        git config credential.https://gogs.app.niko-cloud.ch/niko/sso72.username niko
        git config credential.helper 'cache --timeout 1800'