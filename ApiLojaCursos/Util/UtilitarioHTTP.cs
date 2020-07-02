using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Util
{
    public static class UtilitarioHTTP
    {
        public static ValidacaoDTO InterpretarStatusCode(int status)
        {
            if (status == 200)
            {
                return new ValidacaoDTO() { Status = 200, Mensagem = "Operação concluída com sucesso." };
            }
            else if (status.ToString().StartsWith("4"))
            {
                return new ValidacaoDTO() { Status = status, Mensagem = "Ocorreu um problema na operação." };
            }
            else if (status.ToString().StartsWith("5"))
            {
                return new ValidacaoDTO() { Status = status, Mensagem = "Ocorreu um erro no servidor." };
            }
            return new ValidacaoDTO();
        }
    }
}
