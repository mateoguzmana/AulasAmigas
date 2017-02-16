import {Injectable} from '@angular/core';
import { Http, Headers } from '@angular/http';

@Injectable()
export class contentsService {

  routeAPI: String = "http://localhost:8080/api/controllers/";

  constructor(private http: Http) {
  }

  //Function to call controller in API, this method get all contents of database
  getContents() {
      
    let headers = new Headers();
    headers.append('Content-Type', 'application/json');
    headers.append('Access-Control-Allow-Origin', '*');

    return this.http
      .get(
        this.routeAPI+'contents.controller.php', 
        { headers }
      )
      .map(res => res.json())
      .map((res) => {
        return res; //Return response
      });
  }
}
