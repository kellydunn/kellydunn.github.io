package main

import (
	"bytes"
	"github.com/kellydunn/go-cmd"
	"github.com/eknkc/amber"
	"os"
	"path/filepath"
	"io/ioutil"
)

func main() {
	c := &cmd.Command{Name: "build", Summary: "builds all amber files into html files and places them in a servable directory"}
	c.Run = build
	cmd.Handle("build", c)
	cmd.Serve()
}

func build(c *cmd.Command, args ...string) {
	files, _ := ioutil.ReadDir("views")
	for i := 0; i < len(files); i++ {
		compiler := amber.New()
		name := "./views/" + files[i].Name()

		parseErr := compiler.ParseFile(name)
		if parseErr != nil {
			panic(parseErr)
		}

		var buf bytes.Buffer
		tpl, tplErr := compiler.Compile()
		if tplErr != nil {
			panic(tplErr)
		}

		tpl.Execute(&buf, nil)
		ext := filepath.Ext(filepath.Base(name))
		htmlFile := name[0:len(name) - len(ext)] + ".html"
		f, _ := os.Create(filepath.Base(htmlFile))
		f.Write(buf.Bytes())
	}
}
