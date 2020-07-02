export class TransacaoDTO {
    ID_Transacao: number;
    ID_Curso: number;
    Valor: number;
    DataTransacao: Date;
    Email_Usuario: string;

    constructor(ID_Curso: number, Valor: number, Email_Usuario: string){
        this.ID_Transacao = null;
        this.ID_Curso = ID_Curso;
        this.Valor = Valor;
        this.Email_Usuario = Email_Usuario;
        this.DataTransacao = new Date(Date.now());
    }
}