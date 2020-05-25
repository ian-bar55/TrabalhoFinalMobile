using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidade
{
    public class AutenticacaoEntidade
    {
        public long? ID_Auth { get; set; }
        public long? ID_Usuario { get; set; }
        public string Login { get; set; }
        public string Password_Hash { get; set; }
        public string Password_Salt { get; set; }
    }
}
