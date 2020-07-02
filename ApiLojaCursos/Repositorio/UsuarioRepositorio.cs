using DTO;
using Entidade;
using Repositorio.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Util.Database;

namespace Repositorio
{
    public class UsuarioRepositorio : IUsuarioRepositorio
    {
        public async Task<int> CadastrarUsuario(UsuarioDTO usuario)
        {
            StringBuilder queryCadastrarUsuario = new StringBuilder();
            queryCadastrarUsuario.AppendLine("insert into usuario (Nome,Telefone,Email) values ( ");
            queryCadastrarUsuario.AppendFormat(" '{0}','{1}','{2}'); ",usuario.Nome, usuario.Telefone, usuario.Email);
            try
            {
                await UtilitarioDatabase.ExecutarComando(queryCadastrarUsuario.ToString());
            }
            catch
            {
                return 500;
            }

            return 200;
        }

        public async Task<UsuarioEntidade> ObterDetalheUsuario(string email)
        {
            StringBuilder queryObterUsuario = new StringBuilder();
            queryObterUsuario.AppendFormat("select * from usuario where Email = '{0}'; ", email);

            var result = await UtilitarioDatabase.ExecutarComando(queryObterUsuario.ToString());
            return result[0] as UsuarioEntidade;
        }
    }
}
