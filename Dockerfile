FROM golang:alpine
COPY main.sh ./main.sh
RUN apk -U --no-cache add git file bash
RUN go get -v github.com/cloudfoundry/java-buildpack-memory-calculator && cd src/github.com/cloudfoundry/java-buildpack-memory-calculator && go get -v github.com/tools/godep

ENTRYPOINT ["/go/main.sh"]
CMD ["43","512M"]
