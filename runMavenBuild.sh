if [ -z "${GIT_REPO+xxx}" ]; then echo "GIT_REPO varibale is not set while running the docker container"; exit ; fi

git clone $GIT_REPO repo

cd repo
if [ -z "${BRANCH+xxx}" ];
then
echo 'Building Master Branch'
else
echo 'Switching to Branch : '$BRANCH
git checkout $BRANCH
fi



if [ -z "${MVN_COMMAND+xxx}" ];
then
echo 'MAVEN COMMAND TO RUN : CLEAN INSTALL' 
mvn clean install 
else
echo 'MAVEN COMMAND TO RUN : '$MVN_COMMAND 
mvn $MVN_COMMAND 
fi

echo "Copy Target folder to $BUILD_OUTPUT/."

cp -fR * $BUILD_OUTPUT/.

echo "Changing Permission of Folder $BUILD_OUTPUT/."
chmod -R 777 $BUILD_OUTPUT
chmod -R 777 ~/.m2
echo "permission Updated"
