import { Component, OnInit, Input } from '@angular/core';
import { CursoDTO } from 'src/app/DTO/curso.dto';
import { CursoService } from 'src/app/services/curso.service';

@Component({
  selector: 'app-curso-detalhe',
  templateUrl: './curso-detalhe.component.html',
  styleUrls: ['./curso-detalhe.component.scss'],
})
export class CursoDetalheComponent implements OnInit {
  @Input() curso : CursoDTO;

  constructor(private cursoService: CursoService) { }

  ngOnInit() {}

  addCarrinho(){
    this.cursoService.adicionarAoCarrinho(this.curso);
  }
}
