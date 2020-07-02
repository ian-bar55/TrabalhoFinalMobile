using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service.Interface
{
    public interface IUsuarioService
    {
        ValidacaoDTO CadastrarUsuario(UsuarioDTO usuario);
        UsuarioDTO ObterDetalheUsuario(string email);
    }
}
