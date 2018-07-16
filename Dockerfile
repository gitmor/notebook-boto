# Use the latest ubuntu image as base for the new image
FROM ubuntu

# Run apt-get to install things
RUN apt-get update

RUN apt-get install -y python3 python3-pip

#install jupyter
RUN pip3 install jupyter

#add new user
RUN useradd -ms /bin/bash jupyter

#Change to the new user created above
USER jupyter

# Set container working directory to user home folder
WORKDIR /home/jupyter

#start jupyter notebook
ENTRYPOINT ["jupyter", "notebook", "--ip=*"]
