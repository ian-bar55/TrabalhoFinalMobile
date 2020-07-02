using DTO;
using Entidade;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repositorio.Interface
{
    public interface ICursoRepositorio
    {
        Task<IEnumerable<CursoEntidade>> ListarCursos(string email);
        Task<IEnumerable<CursoEntidade>> ListarCursosAdquiridos(string email);
        Task<int> RegistrarTransacao(TransacaoDTO transacao);
        Task<int> InserirAvaliacaoCurso(AvaliacaoDTO avaliacao);
        Task<AvaliacaoDTO> BuscarAvaliacaoCurso(long ID_Curso);
    }
}
