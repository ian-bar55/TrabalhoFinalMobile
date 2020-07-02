using DTO;
using Repositorio.Interface;
using Service.Interface;
using System;
using System.CodeDom;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Util;

namespace Service
{
    public class CursoService : ICursoService
    {
        private ICursoRepositorio cursoRepositorio;
        private CursoService(ICursoRepositorio _cursoRepositorio)
        {
            this.cursoRepositorio = _cursoRepositorio;
        }

        public decimal BuscarAvaliacaoCurso(long ID_Curso)
        {
            var result = cursoRepositorio.BuscarAvaliacaoCurso(ID_Curso).Result;
            return (decimal)(result.Avaliacao / result.NumeroAvaliadores);
        }

        public IEnumerable<CompraDTO> ComprarCursos(IEnumerable<TransacaoDTO> transacoes)
        {
            List<CompraDTO> compras = new List<CompraDTO>();

            foreach (TransacaoDTO transacao in transacoes)
            {
                ValidacaoDTO result = this.RegistrarTransacao(transacao);

                if (result.Status == 200)
                    compras.Add(new CompraDTO
                    {
                        Codigo = this.GerarCodigoCompra(),
                        ID_Curso = transacao.ID_Curso
                    });
                else
                    throw new Exception(result.Mensagem);
            }

            return compras;
        }

        public ValidacaoDTO InserirAvaliacaoCurso(AvaliacaoDTO avaliacao)
        {
            return UtilitarioHTTP.InterpretarStatusCode(cursoRepositorio.InserirAvaliacaoCurso(avaliacao).Result);
        }

        public IEnumerable<CursoDTO> ListarCursos(string email)
        {
            var registros = this.cursoRepositorio.ListarCursos(email);
            return registros.Result.Select(x => x.ParaDTO());
        }

        public IEnumerable<CursoDTO> ListarCursosAdquiridos(string email)
        {
            var registros = this.cursoRepositorio.ListarCursosAdquiridos(email);
            return registros.Result.Select(x => x.ParaDTO());
        }

        private string GerarCodigoCompra()
        {
            string randomString = Path.GetRandomFileName();
            randomString = randomString.Replace(".", "");
            return randomString.Substring(0, 8);
        }
        private ValidacaoDTO RegistrarTransacao(TransacaoDTO transacao)
        {
            return UtilitarioHTTP.InterpretarStatusCode(this.cursoRepositorio.RegistrarTransacao(transacao).Result);
        }


    }
}
