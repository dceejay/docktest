# Simple Dockerfile that you can build in the node-red directory

FROM node:8-onbuild
VOLUME /root/.node-red
EXPOSE 1880

# Use this to build the image from within the node-red directory
#  docker build -t node-red-project .

# and use this to run it (assumes you want port 1880 mapped direct)
#  docker run -it -p 1880:1880 --name mynodered node-red-project

# Use   docker stop mynodered
# and   docker start mynodered
# to stop and start without losing the flows files.
# and   docker attach mynodered
# to re-attach the terminal to see the output log

# (If you use run again it will create a whole new "machine" with a clean flows file)

# Use   docker inspect mynodered | grep IPA
# to find the ip address to browse to.
