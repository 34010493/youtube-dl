FROM python:alpine

RUN apk add --no-cache \
	ffmpeg\
	tzdata

COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt

RUN wget -qnd "https://bitbucket.org/shield007/atomicparsley/raw/db624c49ba390a64b4b1ff4ebdfc4967957246ee/downloads/build_linux_x86_64/AtomicParsley" && \
    install -m 755 -t /usr/local/bin ./AtomicParsley && \
    rm ./AtomicParsley

# Add files
ADD run.sh /run.sh
ADD entrypoint.sh /entrypoint.sh
 
RUN chmod +x /run.sh /entrypoint.sh

VOLUME ["/youtube-dl"]

ENTRYPOINT /entrypoint.sh
