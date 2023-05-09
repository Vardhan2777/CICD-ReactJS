#!/bin/bash
zip -r react.zip-$BUILD_NUMBER react.sh
aws s3 cp react.zip-$BUILD_NUMBER s3://bucket-name
aws s3 cp s3://bcuket-name/pemfilename .
chmod 400 pemfilename 
ssh -i pemfilename -o "StrictHostKeyChecking=no" ec2-user@PrivateIP "sudo yum install nginx -y && sudo systemctl start nginx && systemctl enable nginx && mkdir deploy"
rm -rf *.zip *.pem
aws s3 cp s3://bucket-name/react.zip-$number .
aws s3 cp s3://bucket-name/pemfilename .
chmod 400 pemfilename
scp -i pemfilename react.zip-$number ec2-user@172.31.13.201:/home/ec2-user/deploy
ssh -i pemfilename ec2-user@PrivateIP 'sudo sh react.sh'
ssh -i pemfilename ec2-user@PrivateIP 'sudo yum install nodejs -y'
ssh -i pemfilename ec2-user@PrivateIP 'sudo npm install -g create-react-app'
ssh -i pemfilename ec2-user@PrivateIP 'sudo chown -R 1000:1000 /root/.npm'
ssh -i pemfilename ec2-user@PrivateIP 'sudo npm install -g npx'
ssh -i pemfilename ec2-user@PrivateIP 'sudo npx create-react-app react-tutorial'
ssh -i pemfilename ec2-user@PrivateIP 'cd ~/react-tutorail && npm start'