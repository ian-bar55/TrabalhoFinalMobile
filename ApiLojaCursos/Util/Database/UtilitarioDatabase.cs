using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;


namespace Util.Database
{
    class UtilitarioDatabase
    {
        private MySqlConnection conexao;
        private MySqlCommand comando;
        private MySqlDataReader dataReader;
        private static UtilitarioDatabase _instance;
       
        public static UtilitarioDatabase GetInstance()
        {
            if (_instance == null)
            {
                _instance = new UtilitarioDatabase();
            }
            return _instance;
        }
        private UtilitarioDatabase()
        {
            this.comando = new MySqlCommand();
        }

        public async Task<List<dynamic>> ExecutarComando(string query)
        {
            await this.AbrirConexao();
            this.comando = new MySqlCommand(query, conexao);
            return this.ExecutarQuery();
        }


        private async Task AbrirConexao()
        {
            if(this.conexao.State == System.Data.ConnectionState.Closed )
            {
                MySqlConnection conexao = new MySqlConnection("server=localhost;User Id=root;database=appdatabase; password=root");

                try
                {
                    await this.conexao.OpenAsync();
                }
                catch
                {
                    throw new Exception("Ocorreu um erro no sistema.");
                }
            }           
        }

        private List<dynamic> ExecutarQuery()
        {
           var result = new List<dynamic>();

           using(this.dataReader = this.comando.ExecuteReader())
            {
                while (this.dataReader.Read())
                {
                    Dictionary<string, object> dict = new Dictionary<string, object>();

                    for (int count = 0; (count <= (this.dataReader.FieldCount - 1)); count++)
                    {
                        dict.Add(this.dataReader.GetName(count), this.dataReader[count]);
                    }
                    result.Add(dict);
                }
            }

            return result;
        }
    }
}
