using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidade
{
    public class CursoEntidade
    {
        public long? Id_Curso { get; set; }
        public string Nome { get; set; }
        public string Duracao { get; set; }
        public string Autor { get; set; }
        public string Descricao { get; set; }
        public string Imagem { get; set; }
        public string Imagem2 { get; set; }
        public string Imagem3 { get; set; }
        public string Imagem4 { get; set; }
        public decimal Valor { get; set; }
        public string Observacoes { get; set; }
        public string PalavrasChave { get; set; }
        public string Link { get; set; }
        public string Idioma { get; set; }
        public string Tecnologias { get; set; }
        public decimal? Avaliacao { get; set; }
        public int? NumAvaliadores { get; set; }
    }
}
