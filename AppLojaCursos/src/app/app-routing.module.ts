import { NgModule } from '@angular/core';
import { PreloadAllModules, RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
    path: '',
    redirectTo: 'boas-vindas',
    pathMatch: 'full'
  },
  {
    path: 'carrinho',
    loadChildren: () => import('./carrinho/carrinho.module').then( m => m.CarrinhoPageModule)
  },
  {
    path: 'minha-conta',
    loadChildren: () => import('./minha-conta/minha-conta.module').then( m => m.MinhaContaPageModule)
  },
  {
    path: 'boas-vindas',
    loadChildren: () => import('./boas-vindas/boas-vindas.module').then( m => m.BoasVindasPageModule)
  },
  {
    path: 'lista-cursos',
    loadChildren: () => import('./lista-cursos/lista-cursos.module').then( m => m.ListaCursosPageModule)
  },
  {
    path: 'meus-cursos',
    loadChildren: () => import('./meus-cursos/meus-cursos.module').then( m => m.MeusCursosPageModule)
  },
  {
    path: 'cadastro',
    loadChildren: () => import('./cadastro/cadastro.module').then( m => m.CadastroPageModule)
  },
  {
    path: 'login',
    loadChildren: () => import('./login/login.module').then( m => m.LoginPageModule)
  }
];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule {}
