package main

import (
    "fmt"
    "io/ioutil"
    "os"
    "path/filepath"
    "strings"
)


func read(filename string, text *string) {
    b, err := ioutil.ReadFile(filename)
    if err != nil {
        fmt.Println(err)
        os.Exit(1)
    }

    *text = strings.ToLower( string(b) )
}

func get_files(root string) []string {
    var files []string
    err := filepath.Walk(root, func(path string, info os.FileInfo, err error) error {
        // to prevent adding directory
        if !info.IsDir() {
            files = append(files, path)
        }
        return nil
    })
    if err != nil {
        panic(err)
    }
    
    return files
}

func main() {
    // if only 2 argument, give error
    if len(os.Args) <= 2 {
        fmt.Println("search <query> <files>...")
        os.Exit(1)
    }
    
    // store file buffer
    var buffer string
    // word and files to lookup in
    word := strings.ToLower( os.Args[1] )
    args := os.Args[2:]
    // to store list of files
    var files []string

    // check if --all or not, if get list of all files in given directory
    if args[0] != "--all" {
        files = args
    } else {
        var root string
        // check if path is given or not
        if len(args) == 1 {
            root = "."
        } else {
            root = args[1]
        }

        files = get_files(root)
    }

    for i:= 0; i<len(files); i++ {
        read(files[i], &buffer)
        
        if strings.Contains(buffer, word) {
            fmt.Printf("Found '%s' in '%s'\n", word, files[i])
        }
    }
}
