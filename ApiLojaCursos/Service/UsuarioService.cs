using DTO;
using Repositorio.Interface;
using Service.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidade;
using Util;

namespace Service
{
    public class UsuarioService : IUsuarioService
    {
        private IUsuarioRepositorio usuarioRepositorio;
        private UsuarioService(IUsuarioRepositorio _usuarioRepositorio)
        {
            this.usuarioRepositorio = _usuarioRepositorio;
        }
        public ValidacaoDTO CadastrarUsuario(UsuarioDTO usuario)
        {
            return UtilitarioHTTP.InterpretarStatusCode(this.usuarioRepositorio.CadastrarUsuario(usuario).Result);
        }

        public UsuarioDTO ObterDetalheUsuario(string email)
        {
            return this.usuarioRepositorio.ObterDetalheUsuario(email).Result.ParaDTO();
            
        }
    }
}
