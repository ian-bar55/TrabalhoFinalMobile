using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidade
{
    public class TransacaoEntidade
    {
        public long? ID_Transacao { get; set; }
        public string Email_Usuario { get; set; }
        public long? ID_Curso { get; set; }
        public decimal Valor { get; set; }
        public DateTime Data { get; set; }
    }
}
