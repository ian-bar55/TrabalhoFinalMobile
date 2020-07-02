import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AngularFireAuth } from '@angular/fire/auth';
import { AlertController } from '@ionic/angular';
import { UsuarioService } from '../services/usuario.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.page.html',
  styleUrls: ['./login.page.scss'],
})
export class LoginPage implements OnInit {

  user = {
    email: '',
    senha: '',
  }
  loading=false;
  error=false;

  constructor(
    private firebaseAuth: AngularFireAuth,
    private router: Router,
    private alertController: AlertController,
    private usuarioService: UsuarioService) { }

  ngOnInit() {
  }

  async login() {
  this.error=false;
  this.loading=true;
  let user: any;
    try { 
      user = await this.firebaseAuth.signInWithEmailAndPassword(this.user.email,this.user.senha)
      if (user.user.email) {      
        this.usuarioService.salvarUsuarioSessao(user.user.email);
        this.router.navigate(['lista-cursos']);
      }
      else {
        this.ExibirAlertaErro();
      }    
    }
    catch(e){
      this.ExibirAlertaErro();
    }
    finally{
      this.loading = false; 
    } 
    
  }
  async ExibirAlertaErro() {
    const alert = await this.alertController.create({
      cssClass: 'alerta-erro',
      header: 'Erro ao logar',
      subHeader: '',
      message: 'Ocorreu um erro na autenticação.',
      buttons: ['Fechar']
    });

    await alert.present();
  }

}
