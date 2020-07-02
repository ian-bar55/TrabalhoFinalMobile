import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { IonicModule } from '@ionic/angular';

import { ListaCursosPage } from './lista-cursos.page';

describe('ListaCursosPage', () => {
  let component: ListaCursosPage;
  let fixture: ComponentFixture<ListaCursosPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ListaCursosPage ],
      imports: [IonicModule.forRoot()]
    }).compileComponents();

    fixture = TestBed.createComponent(ListaCursosPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  }));

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
