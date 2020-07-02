import { Component, OnInit } from '@angular/core';
import { UsuarioService } from '../services/usuario.service';
import { UsuarioDTO } from '../DTO/usuario.dto';
import { AngularFireAuth } from '@angular/fire/auth';
import { Router } from '@angular/router';

@Component({
  selector: 'app-minha-conta',
  templateUrl: './minha-conta.page.html',
  styleUrls: ['./minha-conta.page.scss'],
})
export class MinhaContaPage implements OnInit {

  conta: UsuarioDTO;
  constructor(private usuarioService: UsuarioService,
    private firebaseAuth: AngularFireAuth,private router: Router) {
  }

  ngOnInit() {

  }
  async ionViewWillEnter() {
    let userSessao = await this.usuarioService.getUsuarioSessao();
    this.conta = await this.usuarioService.obterUsuario(userSessao.Email);
  }
  deslogar() {
    this.firebaseAuth.signOut();
    this.router.navigateByUrl('login');
  }
}
