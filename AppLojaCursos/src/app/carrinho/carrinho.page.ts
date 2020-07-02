import { Component, OnInit, ViewChild } from '@angular/core';
import { CursoDTO } from '../DTO/curso.dto';
import { CursoService } from '../services/curso.service';
import { UsuarioService } from '../services/usuario.service';
import { UsuarioDTO } from '../DTO/usuario.dto';
import { TransacaoDTO } from '../DTO/transacao.dto';
import { CompraDTO } from '../DTO/compra.dto';
import { IonInfiniteScroll } from '@ionic/angular';

@Component({
  selector: 'app-carrinho',
  templateUrl: './carrinho.page.html',
  styleUrls: ['./carrinho.page.scss'],
})
export class CarrinhoPage implements OnInit {
  @ViewChild(IonInfiniteScroll) infiniteScroll: IonInfiniteScroll;
  itens: CursoDTO[] = [];
  usuarioLogado: UsuarioDTO;
  constructor(private cursoService: CursoService, private usuarioService: UsuarioService) { }
  compras: CompraDTO[];

  ngOnInit() {
  }
  async ionViewWillEnter(){
    this.itens = await this.cursoService.getItensCarrinho();
  }
  async FinalizarCompra(){
    let transacoes = await this.buildTransacoes();
    this.compras = await this.cursoService.comprarCursos(transacoes);
  }
  async buildTransacoes(){
    let transacoes: TransacaoDTO[] = [];
    let userEmail = await this.usuarioService.getUsuarioSessao();
    this.itens.forEach(x => {
      transacoes.push(new TransacaoDTO(x.Id_Curso,x.Valor,userEmail))
    });
    return transacoes;
  }
  loadData(event) {
    setTimeout(() => {
      console.log('Done');
      event.target.complete();

      // App logic to determine if all data is loaded
      // and disable the infinite scroll
      if (this.itens.length == 1000) {
        event.target.disabled = true;
      }
    }, 500);
  }

  toggleInfiniteScroll() {
    this.infiniteScroll.disabled = !this.infiniteScroll.disabled;
  }

}
