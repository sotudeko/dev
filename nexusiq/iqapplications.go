package main

import(
    "fmt"
    "net/http"
    "io/ioutil"
    "log"
    "encoding/json"
)

type Applications struct {
    Applications []Application `json:"applications"`     
}

type Application struct {
    Id string `json:"id"`
    Name string `json:"name"`
		PublicId string `json:"publicId:`
		OrganisationId string `json:"organizationId"`
}

func main(){
	body := getIQData("admin", "admin123", "http://localhost:8070/api/v2/applications")

	var applications Applications

	json.Unmarshal(body, &applications)

	for i := 0; i < len(applications.Applications); i++ {
		fmt.Println("Application:")
		fmt.Println("  name:" + applications.Applications[i].Name)
        fmt.Println("  id:" + applications.Applications[i].Id)
        
        
	}
}

func getIQData(username, passwd, url string) []byte {

    client := &http.Client{}

    req, err := http.NewRequest("GET", url, nil)
    req.SetBasicAuth(username, passwd)

    resp, err := client.Do(req)

    if err != nil{
        log.Fatal(err)
    }

    bodyText, err := ioutil.ReadAll(resp.Body)

    return bodyText
}


