# project name
app_name := ihome-knx

default: run

# run for current os
run:
	go run .

# build for current os
build: 
	go build -o "./build/$(app_name)"

# build for linux debian x86, arch arm6
arm6:
	GOOS=linux GOARCH=arm GOARM=6 go build -o "./build/linux-arm6/$(app_name)"

# build for linux debian x32, arch arm7
arm7:
	GOOS=linux GOARCH=arm GOARM=7 go build -o "./build/linux-arm7/$(app_name)"

# build for linux debian x64, arch arm8(arm64)
arm8:
	GOOS=linux GOARCH=arm64 go build -o "./build/linux-arm8/$(app_name)"

# build for linux debian x64, arch amd64
linux64:
	GOOS=linux GOARCH=amd64 go build -o "./build/linux-amd64/$(app_name)"

# build for linux debian x32, arch 386
linux32:
	GOOS=linux GOARCH=386 go build -o "./build/linux-x386/$(app_name)"

all: arm6 arm7 arm8 linux64 linux32