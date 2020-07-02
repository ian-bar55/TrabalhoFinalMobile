import { Component, OnInit } from '@angular/core';
import { MenuController } from '@ionic/angular';
import { Router } from '@angular/router';

@Component({
  selector: 'app-boas-vindas',
  templateUrl: './boas-vindas.page.html',
  styleUrls: ['./boas-vindas.page.scss'],
})
export class BoasVindasPage implements OnInit {

  constructor(private menu: MenuController,
    private router: Router) { }

  ionViewWillEnter(){
    this.menu.enable(false);
  }
  ngOnInit() {
  }
  goToLogin(){
    this.menu.enable(true);
    this.router.navigateByUrl('login');
  }
}
