import {Component} from '@angular/core';
import {FormGroup, AbstractControl, FormBuilder, Validators} from '@angular/forms';
import {Router} from "@angular/router";

import {LoginService} from './login.service';

import 'style-loader!./login.scss';

@Component({
  selector: 'login',
  templateUrl: './login.html',
})
export class Login {

  //Define vars
  public form:FormGroup;
  public email:AbstractControl;
  public password:AbstractControl;
  public submitted:boolean = false;

  log = Number;

  //This method initialize validations
  constructor(fb:FormBuilder, private router:Router, private _loginService: LoginService) {
    this.form = fb.group({
      'email': ['', Validators.compose([Validators.required, Validators.minLength(4)])],
      'password': ['', Validators.compose([Validators.required, Validators.minLength(4)])]
    });

    this.email = this.form.controls['email'];
    this.password = this.form.controls['password'];
  }

  public onSubmit(values:Object):void {

    this.submitted = true;
    if (this.form.valid) {
      //Call service to login
      this._loginService.login(this.email.value, this.password.value).subscribe((result) => {
        if (result==1) {
          this.router.navigate(['/pages/dashboard']); //Redirect to index page if is correct
        }else{
          $("#MessageError").fadeIn().delay(2000).fadeOut(); //Show error if email or password isn't valid
        }
      });
    }

  }
}
