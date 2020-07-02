import { Injectable } from '@angular/core';
import { Storage } from '@ionic/storage';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { CursoDTO } from '../DTO/curso.dto';
import { TransacaoDTO } from '../DTO/transacao.dto';
import { CompraDTO } from '../DTO/compra.dto';
import { AvaliacaoDTO } from '../DTO/avaliacao.dto';
import { ValidacaoDTO } from '../DTO/validacao.dto';

@Injectable({
  providedIn: 'root'
})
export class CursoService {
  cursos: CursoDTO[];
  itensCarrinho: CursoDTO[] = [];

  constructor(private storage: Storage, private http: HttpClient) { }
  
  async listarCursos(email: string){
    let url = environment.api.concat('cursos?email=').concat(email);
    let result = await this.http.get(url).toPromise();
    let key = 'cursos';
    this.storage.set(key, result as CursoDTO[]);
    return result as CursoDTO[];
  }
  async listarCursosAdquiridos(email: string){
    let url = environment.api.concat('cursos/adquiridos?email=').concat(email);
    let result = await this.http.get(url).toPromise();
    return result as CursoDTO[];
  }
  async comprarCursos(transacoes: TransacaoDTO[]){
    let url = environment.api.concat('cursos');
    let result = await this.http.post(url, transacoes).toPromise();
    return result as CompraDTO[];
  }
  async inserirAvaliacaoCurso(avaliacao: AvaliacaoDTO){
    let url = environment.api.concat('cursos');
    let result = await this.http.post(url, avaliacao).toPromise();
    return result as ValidacaoDTO[];
  }
  async buscarAvaliacaoCurso(ID_Curso: number){
    let url = environment.api.concat('cursos/avaliacao?ID_Curso='.concat(ID_Curso.toString()));
    let result = await this.http.get(url).toPromise();
    return result as CursoDTO[];
  }
  async adicionarAoCarrinho(curso: CursoDTO){
   let key = "itensCarrinho";
   this.itensCarrinho.push(curso);
   this.storage.set(key, this.itensCarrinho);
  }
  async getItensCarrinho(){
    let key = "itensCarrinho";
    let result = await this.storage.get(key);
    return result as CursoDTO[];
  }
}
