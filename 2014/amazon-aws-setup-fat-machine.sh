# Next time:
#  * need more disk space. 

# Get Amazon AWS Command Line tool
brew install awscli

# Setup instance
aws configure # key, secret, eu-west-1, table
aws ec2 create-key-pair --key-name MyKeyPair --query 'KeyMaterial' --output text > MyKeyPair.pem
aws ec2 run-instances --image-id ami-f0b11187 --instance-type r3.4xlarge --region eu-west-1 --key-name MyKeyPair
aws ec2 describe-instances
aws ec2 authorize-security-group-ingress --group-id sg-86bfxxxx --protocol tcp --port 22 --cidr 0.0.0.0/0

# Setup users and password ssh login
ssh -i MyKeyPair.pem ubuntu@54.xxx.xx.xx
sudo passwd ubuntu # password for admin
sudo adduser mscstudent # password, MSc Student
sudo sed -ie 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo service ssh restart

# Install software
sudo locale-gen en_GB.UTF-8 
sudo apt-get install htop git -y
sudo apt-get install gcc make zlib1g-dev x11-apps r-base -y

sudo add-apt-repository ppa:nebc/bio-linux
sudo apt-get update
sudo apt-get install ncbi-blast+ mafft zsh -y

#make zsh default?  - but would need oh-my-zsh and default configuration. 

# stop running server



