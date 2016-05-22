if [ -z "${GIT_REPO+xxx}" ]; then echo "GIT_REPO varibale is not set while running the docker container"; exit ; fi

git clone $GIT_REPO repo

cd repo

if [ -z "${MVN_COMMAND+xxx}" ];
then
mvn clean install 
else
mvn $MVN_COMMAND 
fi

echo 'Copy Target folder * $BUILD_OUTPUT/.'

cp -fR * $BUILD_OUTPUT/.
