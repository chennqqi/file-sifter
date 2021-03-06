
PACKAGE=github.com/jsthayer/file-sifter
CLI_PACKAGE=github.com/jsthayer/file-sifter/fsift

VERSION=`git describe --tags`
BUILD_DATE=`date +%F`
LDFLAGS=-ldflags "-w -s -X main.Version=${VERSION} -X main.BuildDate=${BUILD_DATE}"

bin:
	go install ${LDFLAGS} ${PACKAGE} ${CLI_PACKAGE}

test:
	go test ${PACKAGE} ${CLI_PACKAGE}

testv:
	go test -v ${PACKAGE} ${CLI_PACKAGE}

coverage:
	go test -coverprofile=/tmp/coverage.out ${PACKAGE}
	go tool cover -html=/tmp/coverage.out

clicover:
	go test -coverprofile=/tmp/coverage.out -coverpkg ${PACKAGE},${CLI_PACKAGE} ${CLI_PACKAGE}
	go tool cover -html=/tmp/coverage.out

docs:
	pandoc -s doc/manpage.md -t man -o doc/fsift.1
	pandoc -s doc/manpage.md -o doc/fsift_manpage.html
