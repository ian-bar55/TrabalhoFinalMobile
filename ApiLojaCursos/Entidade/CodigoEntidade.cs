using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidade
{
    public class CodigoEntidade
    {
        public long? Id_Codigo { get; set; }
        public string Chave { get; set; }
        public DateTime DataGeracao { get; set; }
        public long? ID_Curso { get; set; }
    }
}
