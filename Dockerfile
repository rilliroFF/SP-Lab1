FROM ubuntu:latest
COPY temp.sh .
RUN chmod +x temp.sh
CMD ./temp.sh
