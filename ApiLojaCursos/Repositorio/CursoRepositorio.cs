using DTO;
using Entidade;
using Repositorio.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Threading.Tasks;
using Util.Database;

namespace Repositorio
{
    public class CursoRepositorio : ICursoRepositorio
    {
        public async Task<AvaliacaoDTO> BuscarAvaliacaoCurso(long ID_Curso)
        {
            StringBuilder queryBuscarAvaliacao = new StringBuilder();
            queryBuscarAvaliacao.AppendLine("select Avaliacao, NumAvaliadores, ID_Curso from curso ");
            queryBuscarAvaliacao.AppendFormat(" where ID_Curso = {0};", ID_Curso);
            var result = await UtilitarioDatabase.ExecutarComando(queryBuscarAvaliacao.ToString());
            return new AvaliacaoDTO() {
                Avaliacao = result[0].Avaliacao,
                ID_Curso = result[0].ID_Curso,
                NumeroAvaliadores = result[0].NumAvaliadores
            };        
        }

        public async Task<int> InserirAvaliacaoCurso(AvaliacaoDTO avaliacao)
        {
            StringBuilder queryInserirAvaliacao = new StringBuilder();
            queryInserirAvaliacao.AppendLine("UPDATE curso SET ");
            queryInserirAvaliacao.AppendFormat(" Avaliacao = Avaliacao + {0}, ", avaliacao.Avaliacao);
            queryInserirAvaliacao.AppendLine(" NumAvaliadores = NumAvaliadores + 1 ");
            queryInserirAvaliacao.AppendFormat(" WHERE ID_Curso = {0};", avaliacao.ID_Curso);
            try
            {
                await UtilitarioDatabase.ExecutarComando(queryInserirAvaliacao.ToString());
            }
            catch
            {
                return 500;
            }

            return 200;
        }

        public async Task<IEnumerable<CursoEntidade>> ListarCursos(string email)
        {
            StringBuilder queryListaCursos = new StringBuilder();
            queryListaCursos.AppendLine("select curso.* from curso inner join ( select ID_Curso from transacao ");
            queryListaCursos.AppendFormat("where Email_Usuario = '{0}') ", email);
            queryListaCursos.AppendLine(" adquiridos on adquiridos.ID_Curso = curso.ID_Curso;");
            var result = await UtilitarioDatabase.ExecutarComando(queryListaCursos.ToString());
            return result as IEnumerable<CursoEntidade>;
        }
        public async Task<IEnumerable<CursoEntidade>> ListarCursosAdquiridos(string email)
        {
            StringBuilder queryListaCursosAdquiridos = new StringBuilder();
            queryListaCursosAdquiridos.AppendLine("select curso.* from curso inner join ( select ID_Curso from transacao  ");
            queryListaCursosAdquiridos.AppendFormat("where Email_Usuario != '{0}') ", email);
            queryListaCursosAdquiridos.AppendLine(" produtos on produtos.ID_Curso = curso.ID_Curso;");
            var result = await UtilitarioDatabase.ExecutarComando(queryListaCursosAdquiridos.ToString());
            return result as IEnumerable<CursoEntidade>;
        }

        public async Task<int> RegistrarTransacao(TransacaoDTO transacao)
        {
            StringBuilder queryRegistraTransacao = new StringBuilder();
            queryRegistraTransacao.AppendLine("insert into transacao (ID_Curso,Valor,Data,Email_Usuario) values ");
            queryRegistraTransacao.AppendFormat("{0},{1},'{2}','{3}'", transacao.ID_Curso,transacao.Valor,transacao.DataTransacao.ToString(),transacao.Email_Usuario);
            try
            {
                await UtilitarioDatabase.ExecutarComando(queryRegistraTransacao.ToString());
                return 200;
            }
            catch
            {
                return 500;
            }
        }
    }
}
