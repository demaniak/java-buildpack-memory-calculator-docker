FROM golang:alpine
RUN apk -U --no-cache add git file
RUN go get -v github.com/cloudfoundry/java-buildpack-memory-calculator && cd src/github.com/cloudfoundry/java-buildpack-memory-calculator && go get -v github.com/tools/godep
ENTRYPOINT ["/go/bin/java-buildpack-memory-calculator"]
