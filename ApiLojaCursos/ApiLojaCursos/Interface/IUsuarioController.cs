using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApiLojaCursos.Interface
{
    public interface IUsuarioController
    {
        ValidacaoDTO CadastrarUsuario(UsuarioDTO usuario);
        UsuarioDTO ObterDetalheUsuario(string email);
    }
}