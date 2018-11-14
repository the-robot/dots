package main

import (
    "bufio"
    "fmt"
    "log"
    "os"
    "path/filepath"
    "regexp"
)


func search(filename string, query string) bool {
    file, err := os.Open(filename)
    if err != nil {
        log.Fatal(err)
    }
    defer file.Close()

    scanner := bufio.NewScanner(file)
    // search line by line
    for scanner.Scan() {
        var text string = scanner.Text()

        fmt.Println(text)
        //return true
    }

    if err := scanner.Err(); err != nil {
        log.Fatal(err)
    }

    return false
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
    
    // store file buffer and list of files to be serch over
    var files []string
    
    word := os.Args[1]
    query := regexp.MustCompile( fmt.Sprintf(".*%s.*", word) )
    args := os.Args[2:]

    fmt.Println(query.MatchString("world is a simple program"))

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
        if search(files[i], word) {
            //fmt.Println("Found")
        }
    }
}
