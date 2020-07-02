import { Injectable } from '@angular/core';
import { UsuarioDTO } from '../DTO/usuario.dto';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { Storage } from '@ionic/storage';

@Injectable({
  providedIn: 'root'
})
export class UsuarioService {

  constructor(private http: HttpClient,
    private storage: Storage) { }

  async cadastrarUsuario(usuario: UsuarioDTO){
    let url = environment.api.concat('usuario');
    this.http.post(environment.api,usuario);
  }
  async obterUsuario(email: string){
    let url = environment.api.concat('usuario?email=').concat(email);
    let usuario = await this.http.get(url).toPromise();
    return usuario as UsuarioDTO;
  }
  async salvarUsuarioSessao(email: string){
    let key = "userSessao";
    this.storage.set(key, email);
  }
  async getUsuarioSessao(){
    let key = "userSessao";
    let user = await this.storage.get(key);
    return user;
  }
}
