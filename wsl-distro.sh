sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt dist-upgrade -y
sudo apt-get install -y git nodejs wget vim # curl 

#beautify
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y





# Install Dockers package dependencies.
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Download and add Dockers official public PGP key.
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

# Verify the fingerprint.
sudo apt-key fingerprint 0EBFCD88

# Add the `stable` channels Docker upstream repository.
# If you want to live on the edge, you can change "stable" below to "test" or
# "nightly". I highly recommend sticking with stable!
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

# Update the apt package list (for the new apt repo).
sudo apt-get update -y

# Install the latest version of Docker CE.
sudo apt-get install docker-ce docker-ce-cli containerd.io -Y

# Allow your user to access the Docker CLI without needing root access.
sudo usermod -aG docker $USER

# Install Python 3 and PIP.
sudo apt-get install -y python3 python3-pip

# Install Docker Compose into your users home directory.
pip3 install --user docker-compose

sudo ln -s /usr/bin/python3 /usr/bin/python
sudo ln -s /usr/bin/pip3 /usr/bin/pip