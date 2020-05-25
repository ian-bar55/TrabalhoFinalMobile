using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Util;

namespace Entidade
{
    public class CartaoEntidade
    {
        public string Numero { get; set; }
        public TipoCartaoEnum Tipo { get; set; }
        public int Cvv { get; set; }
        public string Documento { get; set; }
        public string Nome { get; set; }
        public string Validade { get; set; }

    }
}
