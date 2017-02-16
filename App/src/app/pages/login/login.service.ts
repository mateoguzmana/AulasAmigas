import { Injectable } from '@angular/core';
import { Http, Headers } from '@angular/http';

@Injectable()
export class LoginService {

  routeAPI: String = "http://localhost:8080/api/controllers/";

  constructor(private http: Http) {
  }

  //Function to call controller in API 
  login(email, password) {
      
    let headers = new Headers();
    headers.append('Content-Type', 'application/json');
    headers.append('Access-Control-Allow-Origin', '*');

    return this.http
      .post(
        this.routeAPI+'login.controller.php', 
        {email: email, password: password}, 
        { headers }
      )
      .map(res => res.json())
      .map((res) => {
        if (res.state=="1"){
          localStorage.setItem('user', res.iduser ); //Set user in local storage
        }

        return res.state; //Return response
      });
  }
}
