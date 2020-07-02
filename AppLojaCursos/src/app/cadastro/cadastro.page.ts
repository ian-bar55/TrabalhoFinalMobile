import { Component, OnInit, SimpleChange } from '@angular/core';
import { AlertController, ToastController } from '@ionic/angular';
import { Router } from '@angular/router';
import { AngularFireAuth } from '@angular/fire/auth';
import { UsuarioDTO } from '../DTO/usuario.dto';
import { UsuarioService } from '../services/usuario.service';

@Component({
  selector: 'app-cadastro',
  templateUrl: './cadastro.page.html',
  styleUrls: ['./cadastro.page.scss'],
})
export class CadastroPage implements OnInit {
  usuario = {} as UsuarioDTO;
  loading = false;
  error = false;
  senha: string;
 

  constructor(
    private firebaseAuth: AngularFireAuth,
    private router: Router,
    private alertController: AlertController,
    private toastController: ToastController,
    private usuarioService: UsuarioService
    ) {
    this.usuario = new UsuarioDTO;
  }


  ngOnInit() {
  }
 
  async registrar() {
    this.error = false;
    this.loading = true;
    let user: any;
    try {
      console.log(this.usuario.Email + '' + this.senha);
      user = await this.firebaseAuth.createUserWithEmailAndPassword(this.usuario.Email, this.senha);
      if (user.user.email) {
        this.presentToast();
        this.usuarioService.cadastrarUsuario(this.usuario);
        this.router.navigate(['lista-cursos']);
      }
      else{
        this.ExibirAlertaErro('Ocorreu um erro no cadastro.');
        console.log(user.user.email);
      }
    }
    catch (e) {
      this.ExibirAlertaErro('Insira uma senha forte com mais de 6 caracteres.');
    }
    finally {
      this.loading = false;
    }
  }
  async ExibirAlertaErro(mensagem: string) {
    const alert = await this.alertController.create({
      cssClass: 'alerta-erro',
      header: 'Erro ao cadastrar',
      subHeader: '',
      message: mensagem,
      buttons: ['Fechar']
    });

    await alert.present();
  }
  async presentToast() {
    const toast = await this.toastController.create({
      message: 'Usuário cadastrado com sucesso.',
      duration: 1000
    });
    toast.present();
  }
}
