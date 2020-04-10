
echo "Deploying Build"

F:
cd F:\RetailBanking\retailbank-app\

echo "copying the war file to be deploy at the location were dockerfile is present"
copy target\retailbank-app-1.0.war ..\docker\

cd ..\docker\

echo "Building the docker Image from the dockerfile and tagging it as retailbankimage"
docker build -t retailbankimage .

echo "Removing the previous retailbankcontainer container if present"
docker rm -f retailbankcontainer

echo "Using the docker image the conatiner is run -- this will deply the application on the WildFly(JBoss) Server"
docker run -d -p 8081:8081 --name retailbankcontainer retailbankimage

echo "Application deployed successfully at http://<Deployment_Server_IP>:8081/ "
