using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApiLojaCursos.Interface
{
    public interface ICursoController
    {
        IEnumerable<CursoDTO> ListarCursos(string email);
        IEnumerable<CursoDTO> ListarCursosAdquiridos(string email);
        IEnumerable<CompraDTO> ComprarCursos(IEnumerable<TransacaoDTO> transacoes);
        ValidacaoDTO InserirAvaliacaoCurso(AvaliacaoDTO avaliacao);
        decimal BuscarAvaliacaoCurso(long ID_Curso);
    }
}