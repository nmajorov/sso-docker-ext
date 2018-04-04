# Build custom docker sso72 image

## Build locally with docker

run command to build locally:

        ./build_local.sh


test/run locally:


            docker run --rm -ti -p 8080:8080  ch/sso72


go to url [http://localhost:8080](http://localhost:8080)

username: admin password: Sion2018!


## Build on openshift



        GIT_SSL_NO_VERIFY=true oc new-app https://gogs.app.niko-cloud.ch/niko/sso72 --strategy=docker --source-secret=gitsecret



1. Create secret to pull from registry:

        oc secrets new-basicauth gitsecret \
        --username=$GIT_USER \
        --password=$GIT_PASSWORD \
        --gitconfig=.gitconfig

## Tips

git option to ignore self-signet certificate:


      