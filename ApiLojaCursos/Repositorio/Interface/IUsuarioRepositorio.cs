using DTO;
using Entidade;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repositorio.Interface
{
    public interface IUsuarioRepositorio
    {
        Task<int> CadastrarUsuario(UsuarioDTO usuario);
        Task<UsuarioEntidade> ObterDetalheUsuario(string email);
    }
}
