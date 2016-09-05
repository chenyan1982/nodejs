###############################################################################
#                           Header Documentation                              #
###############################################################################


###############################################################################
#                                   Header                                    #
###############################################################################
FROM sigsciserverimg/ubuntu_14.04-nodejs_5.9.1
MAINTAINER Calvin.Chen

###############################################################################
#                            Environment Variables                            #
###############################################################################

# new user
ENV DOCKER_USER=inlay

# Password for the root
ENV ROOT_USER_PASSWORD=root

###############################################################################
#                                Instructions                                 #
###############################################################################
# Install dependencies
RUN apt-get update -yq \
	&& apt-get upgrade -yq

RUN apt-get install -yq --no-install-recommends \
        gcc \
        g++ \
        make \
        python \
        adduser


# Set the root password
RUN echo "root:${ROOT_USER_PASSWORD}" | chpasswd

# Create new user
RUN useradd --user-group --create-home --shell /bin/false ${DOCKER_USER}

# Set the user id
USER ${DOCKER_USER}

WORKDIR /home/${DOCKER_USER}


CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
