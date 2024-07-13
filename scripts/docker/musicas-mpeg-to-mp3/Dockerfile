FROM python:3.9-slim
RUN apt-get update && apt-get install -y ffmpeg
WORKDIR /app
COPY converter.sh .
COPY medias/ /medias/
RUN chmod +x converter.sh
CMD ["./converter.sh"]
