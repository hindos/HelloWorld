# test fake commit
#FROM us.icr.io/lcl-images/ace-server-prod:11.0.0.11-r1
FROM docker.io/hindos/ace-server
USER root
COPY BARs/*.bar /home/aceuser/initial-config/bars/
USER aceuser

