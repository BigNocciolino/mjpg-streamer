FROM ubuntu:latest

LABEL Maintainer="Alfonso Sorrentino"
LABEL Description="A Docker image for mjpg_streamer." Version="0.3"

ENV INPUT_PLUGIN="input_uvc.so"
ENV OUTPUT_PLUGIN="output_http.so -w ./www --port 8080"

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

RUN make \
    && make install \
    && chmod +x docker-start.sh

EXPOSE 8080/TCP

# ENTRYPOINT ["/mjpg-streamer/docker-start.sh", "input_uvc.so"]

# FIXME setting the parameter on run take as second argument the first space 
CMD /mjpg-streamer/docker-start.sh "${INPUT_PLUGIN}" "${OUTPUT_PLUGIN}"
