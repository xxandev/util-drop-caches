package main

import (
	"flag"
	"io/ioutil"
	"log"
	"os"
	"os/exec"
	"runtime"
)

func init() {
	log.SetOutput(os.Stdout)
	log.SetPrefix("[DROP-CACHES] ")
	log.SetFlags(log.Ldate | log.Ltime | log.Lmsgprefix)

	mute := flag.Bool("mute", false, "mute log")
	flag.Parse()

	if *mute {
		log.SetOutput(ioutil.Discard)
	}

	if runtime.GOOS != "linux" {
		log.Fatalln("utility for linux only")
	}
}

func main() {
	log.Println("run...")
	if err := DropCaches(); err != nil {
		log.Fatalln("error:", err)
	}
	log.Println("ok.")
}

func DropCaches() error {
	command := exec.Command("bash", "-c", "sh", "-c", "echo 3 > /proc/sys/vm/drop_caches")
	return command.Run()
}
