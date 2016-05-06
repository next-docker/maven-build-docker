if [ -z "${GIT_REPO+xxx}" ]; then echo "GIT_REPO varibale is not set while running the docker container"; exit ; fi

git clone $GIT_REPO

cd dynamo

if [ -z "${MVN_COMMAND+xxx}" ];
then
mvn clean install 
else
mvn $MVN_COMMAND 
fi

echo 'Copy Target folder'

cp -fR ./core/target/* /root/target/.
cp -fR ./core/target /root/.m2/.
cp -fR ./core/target/* /var/target/.

sleep 1800
