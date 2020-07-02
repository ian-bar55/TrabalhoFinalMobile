import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { IonicModule } from '@ionic/angular';

import { BoasVindasPage } from './boas-vindas.page';

describe('BoasVindasPage', () => {
  let component: BoasVindasPage;
  let fixture: ComponentFixture<BoasVindasPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ BoasVindasPage ],
      imports: [IonicModule.forRoot()]
    }).compileComponents();

    fixture = TestBed.createComponent(BoasVindasPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  }));

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
