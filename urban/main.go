package main

import (
    "github.com/tidwall/gjson"

    "io/ioutil"
    "net/http"
    "fmt"
    "os"
    "strings"
)


const URL string = "http://api.urbandictionary.com/v0/define?term="

type Definition struct {
    definition string
    example    string
}

func show(def Definition) {
    fmt.Println(def.definition)
}

func get(word string) []Definition {
    // to store definitions
    defs := []Definition {}

    req, err := http.Get(URL + word)
    if err != nil {
        panic(err)
    }
    defer req.Body.Close()

    if req.StatusCode == 200 {
        body, _ := ioutil.ReadAll(req.Body)
        json := string(body)
        values := gjson.Get(json, "list").Array()
    
        // add definitions to struct
        for i:=0; i<len(values); i++ {
            def := Definition {
                definition: strings.TrimSpace( gjson.Get(values[i].String(), "definition").String() ),
                example: strings.TrimSpace( gjson.Get(values[i].String(), "example").String() ),
            }
            defs = append(defs, def)
        }
    }

    return defs
}


func main() {
    args := os.Args[1:]

    if len(args) == 0 || len(args) > 2 {
        fmt.Fprintf(os.Stderr, "USAGE: urban {word}\n")
        os.Exit(1)
    } else if len(args) == 2 && args[1] != "--all" {
        fmt.Fprintf(os.Stderr, "USAGE: urban {word} --all\n")
        os.Exit(1)
    }

    defs := get(args[0])
    if len(defs) == 0 {
        fmt.Printf("%s cannot be found", args[0])
        return
    }
    // if defs found
    if len(args) == 1 {
        show(defs[0])
    } else if len(args) == 2 {
        for i:=0; i<len(defs); i++ {
            fmt.Printf("Definition %d\n", i+1)
            show(defs[i])
            fmt.Printf("\n")
        }
    }
}
