# Build custom docker sso72 image

## Build locally with docker

run command to build locally:

        ./build_local.sh


test/run locally:


            docker run --rm -ti -p 8080:8080  ch/sso72


go to url [http://localhost:8080](http://localhost:8080)

username: admin password: Sion2018!


## Tips

git option to ignore self-signet certificate:


            git config http.sslVerify "false"



