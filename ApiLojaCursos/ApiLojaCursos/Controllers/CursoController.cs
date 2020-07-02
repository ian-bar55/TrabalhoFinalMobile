using ApiLojaCursos.Interface;
using DTO;
using Service.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ApiLojaCursos.Controllers
{
    [RoutePrefix("cursos")]
    public class CursoController : ApiController, ICursoController
    {
        private ICursoService cursoService;
        private CursoController(ICursoService _cursoService)
        {
            this.cursoService = _cursoService;
        }

        [HttpGet]
        public IEnumerable<CursoDTO> ListarCursos([FromUri] string email)
        {
            return this.cursoService.ListarCursos(email);
        }

        [HttpGet]
        [Route("adquiridos")]
        public IEnumerable<CursoDTO> ListarCursosAdquiridos([FromUri] string email)
        {
            return this.cursoService.ListarCursosAdquiridos(email);
        }

        [HttpPost]
        public IEnumerable<CompraDTO> ComprarCursos([FromBody] IEnumerable<TransacaoDTO> transacoes)
        {
            return this.cursoService.ComprarCursos(transacoes);
        }
        [HttpPost]
        public ValidacaoDTO InserirAvaliacaoCurso([FromBody] AvaliacaoDTO avaliacao)
        {
            return cursoService.InserirAvaliacaoCurso(avaliacao);
        }
        [HttpGet]
        [Route("avaliacao")]
        public decimal BuscarAvaliacaoCurso([FromUri] long ID_Curso)
        {
            return cursoService.BuscarAvaliacaoCurso(ID_Curso);
        }
    }
}
