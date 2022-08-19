package main

import (
	"{{cookiecutter.project.github.repository}}/internal/models/foo"
	"fmt"
)

func main() {
	fmt.Println("This is the main entry point for: '{{cookiecutter.project.github.repository}}'")
	fmt.Println(foo.Get())
}
