import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { IonicModule } from '@ionic/angular';

import { MeusCursosPage } from './meus-cursos.page';

describe('MeusCursosPage', () => {
  let component: MeusCursosPage;
  let fixture: ComponentFixture<MeusCursosPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MeusCursosPage ],
      imports: [IonicModule.forRoot()]
    }).compileComponents();

    fixture = TestBed.createComponent(MeusCursosPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  }));

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
