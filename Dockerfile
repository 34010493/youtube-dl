FROM python:alpine

RUN pip install youtube-dl
RUN apk add ffmpeg
RUN wget -qnd "https://bitbucket.org/shield007/atomicparsley/raw/db624c49ba390a64b4b1ff4ebdfc4967957246ee/downloads/build_linux_x86_64/AtomicParsley" && \
    install -m 755 -t /usr/local/bin ./AtomicParsley && \
    rm ./AtomicParsley

# Add files
ADD run.sh /run.sh
ADD entrypoint.sh /entrypoint.sh
 
RUN chmod +x /run.sh /entrypoint.sh

ENTRYPOINT /entrypoint.sh
