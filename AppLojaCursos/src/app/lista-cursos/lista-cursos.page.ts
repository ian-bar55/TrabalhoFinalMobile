import { Component, OnInit, ViewChild } from '@angular/core';
import { CursoService } from '../services/curso.service';
import { CursoDTO } from '../DTO/curso.dto';
import { UsuarioDTO } from '../DTO/usuario.dto';
import { UsuarioService } from '../services/usuario.service';
import { IonInfiniteScroll } from '@ionic/angular';

@Component({
  selector: 'app-lista-cursos',
  templateUrl: './lista-cursos.page.html',
  styleUrls: ['./lista-cursos.page.scss'],
})
export class ListaCursosPage implements OnInit {
  @ViewChild(IonInfiniteScroll) infiniteScroll: IonInfiniteScroll;
  listaCursos: CursoDTO[];
  selectedCourses: CursoDTO[] = [];
  usuarioLogado: UsuarioDTO;

  constructor(private cursoService: CursoService,
    private usuarioService: UsuarioService) { }

  ngOnInit() {
  }

  async ionViewWillEnter(){
    this.usuarioLogado = await this.usuarioService.getUsuarioSessao();
    this.listaCursos = await this.cursoService.listarCursosAdquiridos(this.usuarioLogado.Email);
  }
  loadData(event) {
    setTimeout(() => {
      console.log('Done');
      event.target.complete();

      // App logic to determine if all data is loaded
      // and disable the infinite scroll
      if (this.listaCursos.length == 1000) {
        event.target.disabled = true;
      }
    }, 500);
  }

  toggleInfiniteScroll() {
    this.infiniteScroll.disabled = !this.infiniteScroll.disabled;
  }

}
