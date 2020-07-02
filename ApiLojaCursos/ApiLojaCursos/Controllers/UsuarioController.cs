using ApiLojaCursos.Interface;
using DTO;
using Service;
using Service.Interface;
using System;
using System.Collections.Generic;
using System.Drawing.Text;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ApiLojaCursos.Controllers
{
    [RoutePrefix("usuario")]
    public class UsuarioController : ApiController, IUsuarioController
    {
        private IUsuarioService usuarioService;

        private UsuarioController(IUsuarioService _usuarioService)
        {
            this.usuarioService = _usuarioService;
        }

        [HttpGet]
        public UsuarioDTO ObterDetalheUsuario([FromUri] string email)
        {
            return this.usuarioService.ObterDetalheUsuario(email);
        }

        [HttpPost]
        public ValidacaoDTO CadastrarUsuario([FromBody] UsuarioDTO usuario)
        {
            return this.usuarioService.CadastrarUsuario(usuario);
        }

    }
}
