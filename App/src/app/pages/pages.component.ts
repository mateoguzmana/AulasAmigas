import { Component } from '@angular/core';
import { Routes } from '@angular/router';

import { BaMenuService } from '../theme';
import { MENU } from '../app.menu';

@Component({
  selector: 'pages',
  template: `
    <!--<ba-sidebar></ba-sidebar>-->
    <ba-page-top></ba-page-top>
    <div class="al-main" style="background-color:#e5e5e5">
      <div class="al-content">
        <!--<ba-content-top></ba-content-top>-->
        <router-outlet></router-outlet>
      </div>
    </div>
    <footer class="al-footer clearfix" style="color:black;">
      <div class="al-footer-right">Creado con <i class="ion-heart"></i></div>
      <div class="al-footer-main clearfix">
        <div class="al-copy">&copy; Mateo Guzmán 2017</div>
      </div>
    </footer>
    <ba-back-top position="200"></ba-back-top>
    `
})
export class Pages {

  constructor(private _menuService: BaMenuService,) {
  }

  ngOnInit() {
    this._menuService.updateMenuByRoutes(<Routes>MENU);
  }
}
