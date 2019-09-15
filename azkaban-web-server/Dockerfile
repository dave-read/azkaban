FROM openjdk:8
WORKDIR /azkaban
# assumes gradle build with target installDist was run to produce folder:
# azkaban-web-server/build/install/azkaban-web-server
# with folders:
#   bin	
#   conf
#	lib	
#   web
#  
# we don't want conf folder as conf folder will provided by k8s volume mount with secrets and configmaps
#
COPY bin/ ./bin/
COPY lib/ ./lib/
COPY web/ ./web/

ENTRYPOINT "/azkaban/bin/start-web.sh"