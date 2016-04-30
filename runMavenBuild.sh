if [ -z "${GIT_REPO+xxx}" ]; then echo "GIT_REPO varibale is not set while running the docker container"; exit ; fi

git clone $GIT_REPO

cd dynamo

mvn clean install

echo 'Copy Target folder'
ls -lrt target/*

cp -fR target/* /target/.
