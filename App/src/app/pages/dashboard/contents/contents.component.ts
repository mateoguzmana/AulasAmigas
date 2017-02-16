import {Component} from '@angular/core';

import {contentsService} from './contents.service';

import 'style-loader!./contents.scss';

@Component({
  selector: 'contents',
  templateUrl: './contents.html'
})

export class contents {

  public contents: Array<Object>;
  private _init = false;

  constructor(private _contentsService: contentsService) {
    // Call service
    this._contentsService.getContents().subscribe((result) => {
        this.contents = result; //Return result to service
    });
  }

  ngAfterViewInit() {
    if (!this._init) {
      this._init = true;
    }
  }
}
