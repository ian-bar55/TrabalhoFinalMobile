using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Util;

namespace Entidade
{
    public class UsuarioCartaoEntidade
    {
        public long? ID_UsuarioCartao { get; set; }
        public long? ID_Usuario { get; set; }
        public string NumeroCartao { get; set; }
        public PadraoEnum Padrao { get; set; }
    }
}
