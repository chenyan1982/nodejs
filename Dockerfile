###############################################################################
#                                   Header                                    #
###############################################################################
FROM sigsciserverimg/ubuntu_14.04-nodejs_5.9.1
MAINTAINER Calvin.Chen

###############################################################################
#                            Environment Variables                            #
###############################################################################

# Password for the root
ENV ROOT_USER_PASSWORD=root

###############################################################################
#                                Instructions                                 #
###############################################################################
# Set the root password
RUN echo "root:${ROOT_USER_PASSWORD}" | chpasswd

CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
