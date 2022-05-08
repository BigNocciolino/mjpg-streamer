FROM ubuntu:latest

LABEL Maintainer="Alfonso Sorrentino"
LABEL Description="A Docker image for mjpg_streamer." Version="0.3"

RUN apt-get -y update
RUN apt-get -y install git make cmake libjpeg-dev

# Build mjpg_streamer
# Need to run container with the device: docker run -t -i -p 8080:8080/tcp --device=/dev/video0 image:tag
# RUN git clone https://github.com/jacksonliam/mjpg-streamer.git 

# WORKDIR /mjpg-streamer/mjpg-streamer-experimental

# RUN make \ 
#     && make install \
#     && chmod +x docker-start.sh

COPY . /mjpg-streamer/
WORKDIR /mjpg-streamer/

EXPOSE 8082/TCP

ENTRYPOINT ["/mjpg-streamer/docker-start.sh", "output_http.so -w ./www --port 8082"]

CMD ["input_uvc.so"]
