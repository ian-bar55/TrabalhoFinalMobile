using DTO;
using Entidade;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Util
{
    public static class UtilitarioParaDTO
    {
        public static CursoDTO ParaDTO(this CursoEntidade entidade)
        {
            return new CursoDTO()
            {
                Autor = entidade.Autor,
                Avaliacao = entidade.Avaliacao,
                Descricao = entidade.Descricao,
                Duracao = entidade.Duracao,
                Idioma = entidade.Idioma,
                Id_Curso = entidade.Id_Curso,
                Link = entidade.Link,
                Nome = entidade.Nome,
                NumAvaliadores = entidade.NumAvaliadores,
                Observacoes = entidade.Observacoes,
                PalavrasChave = entidade.PalavrasChave,
                Tecnologias = entidade.Tecnologias,
                Valor = entidade.Valor
            };
        }

        public static UsuarioDTO ParaDTO(this UsuarioEntidade entidade)
        {
            return new UsuarioDTO()
            {
                ID_Usuario = entidade.ID_Usuario,
                Email = entidade.Email,
                Nome = entidade.Nome,
                Telefone = entidade.Telefone
            };
        }
    }
}
