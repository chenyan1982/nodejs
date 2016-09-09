###############################################################################
#                           Header Documentation                              #
###############################################################################


###############################################################################
#                                   Header                                    #
###############################################################################
FROM readytalk/nodejs
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

WORKDIR /app

CMD []
ENTRYPOINT ["/nodejs/bin/npm", "start"]
