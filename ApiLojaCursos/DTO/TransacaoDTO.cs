using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class TransacaoDTO
    {
        public long ID_Transacao { get; set; }
        public long ID_Curso { get; set; }
        public decimal Valor { get; set; }
        public DateTime DataTransacao { get; set; }
        public string Email_Usuario { get; set; }
    }
}
