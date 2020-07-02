using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;


namespace Util.Database
{
    public static class UtilitarioDatabase
    {
        private static MySqlConnection Conexao = new MySqlConnection();
        public static MySqlCommand Comando;
        public static MySqlDataReader DataReader;

        public static async Task<List<dynamic>> ExecutarComando(string query)
        {
            await AbrirConexao();
            Comando = new MySqlCommand(query, Conexao);
            var resultado = ExecutarQuery();
            Conexao.Dispose();
            return resultado;
        }


        private static async Task AbrirConexao()
        {
            if (Conexao.State == System.Data.ConnectionState.Closed)
            {
                Conexao = new MySqlConnection("server=localhost;User Id=root;database=appdatabase; password=root");

                try
                {
                    await Conexao.OpenAsync();
                }
                catch
                {
                    throw new Exception("Ocorreu um erro no sistema.");
                }
            }
        }

        private static List<dynamic> ExecutarQuery()
        {
            var result = new List<dynamic>();

            using (DataReader = Comando.ExecuteReader())
            {
                while (DataReader.Read())
                {
                    Dictionary<string, object> dict = new Dictionary<string, object>();

                    for (int count = 0; (count <= (DataReader.FieldCount - 1)); count++)
                    {
                        dict.Add(DataReader.GetName(count), DataReader[count]);
                    }
                    result.Add(dict);
                }
            }

            return result;
        }
    }
}
