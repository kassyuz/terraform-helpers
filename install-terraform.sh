#/bin/bash

TF_VERSION=$1
TIMESTAMP=$(date '+%s')

if [ -z "$TF_VERSION" ]
then
      echo "\$TF_VERSION is empty, inform Terraform version, e.g. ./install-terraform.sh 0.12.19"
      exit 1
fi

cd ~
echo "Creating temp folder tmp-$TIMESTAMP"
mkdir tmp-$TIMESTAMP
cd tmp-$TIMESTAMP

echo "Downloading Terraform $TF_VERSION"
wget https://releases.hashicorp.com/terraform/$TF_VERSION/terraform_$TF_VERSION\_linux_amd64.zip

echo "Creating Folder"
mkdir -p /usr/local/bin/terraform-$TF_VERSION



echo "Unzipping"
unzip terraform_$TF_VERSION\_linux_amd64.zip 

echo "Moving terraform binary to /usr/local/bin"
mv -f ./terraform /usr/local/bin/terraform-$TF_VERSION/terraform

echo "Removing tf alias"
rm /home/cassio/bin/tf

echo "Creating soft link to TF $TF_VERSION"
ln -s /usr/local/bin/terraform-$TF_VERSION/terraform /home/cassio/bin/tf

echo "Removing zip file"
cd ..
rm -rf tmp-$TIMESTAMP
