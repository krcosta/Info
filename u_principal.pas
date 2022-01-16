unit u_principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBClient, ExtCtrls, DBCtrls, StdCtrls, Mask,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  Buttons, xmldom, XMLIntf, msxmldom, XMLDoc, IdMessageClient,
  IdSMTP, IdMessage, IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL,
  IdExplicitTLSClientServerBase, IdSMTPBase, IdIOHandlerStack, IdSSL, IdPOP3,
  IdAttachment, IdAttachmentFile, IdAttachmentMemory, IdMessageParts, JSON;

type
  Tf_principal = class(TForm)
    nav_Principal: TDBNavigator;
    cds_Temp: TClientDataSet;
    cds_TempNome: TStringField;
    cds_TempIdentidade: TStringField;
    cds_TempCPF: TStringField;
    cds_TempTelefone: TStringField;
    cds_TempEmail: TStringField;
    cds_TempCEP: TStringField;
    cds_TempLogradouro: TStringField;
    cds_TempNumero: TIntegerField;
    cds_TempComplemento: TStringField;
    cds_TempBairro: TStringField;
    cds_TempCidade: TStringField;
    cds_TempEstado: TStringField;
    cds_TempPais: TStringField;
    dts_Principal: TDataSource;
    Label1: TLabel;
    edt_Nome: TDBEdit;
    Label2: TLabel;
    edt_Identidade: TDBEdit;
    Label3: TLabel;
    edt_Cpf: TDBEdit;
    Label4: TLabel;
    edt_Telefone: TDBEdit;
    Label5: TLabel;
    edt_Email: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edt_Cep: TDBEdit;
    edt_Logradouro: TDBEdit;
    edt_Numero: TDBEdit;
    Label9: TLabel;
    edt_Complemento: TDBEdit;
    Label10: TLabel;
    edt_Bairro: TDBEdit;
    Label11: TLabel;
    edt_Cidade: TDBEdit;
    Label12: TLabel;
    edt_Estado: TDBEdit;
    Label13: TLabel;
    edt_Pais: TDBEdit;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    edt_usuario: TEdit;
    edt_senha: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    edt_Endereco: TEdit;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure EnviarEmail(username, password, endereco, titulo, corpo: string);
    function GerarCorpoEmail : string;
  end;

var
  f_principal: Tf_principal;

implementation

{$R *.dfm}

procedure Tf_principal.Button1Click(Sender: TObject);
var
  XMLDocument: TXMLDocument;
  No: IXMLNode;

  Corpo : string;
  Titulo : string;
begin
  // CRIA O ARQUIVO XML
  try
    XMLDocument := TXMLDocument.Create(Self);
    XMLDocument.Active := True;
    No := XMLDocument.AddChild('DADOS');
    No.ChildValues['NOME'] := cds_Temp.FieldByName('NOME').AsString;
    No.ChildValues['IDENTIDADE'] := cds_Temp.FieldByName('IDENTIDADE').AsString;
    No.ChildValues['CPF'] := cds_Temp.FieldByName('CPF').AsString;
    No.ChildValues['TELEFONE'] := cds_Temp.FieldByName('TELEFONE').AsString;
    No.ChildValues['EMAIL'] := cds_Temp.FieldByName('EMAIL').AsString;
    No := No.AddChild('ENDERECO');
    No.ChildValues['CEP'] := cds_Temp.FieldByName('CEP').AsString;
    No.ChildValues['LOGRADOURO'] := cds_Temp.FieldByName('LOGRADOURO').AsString;
    No.ChildValues['NUMERO'] := cds_Temp.FieldByName('NUMERO').AsString;
    No.ChildValues['COMPLEMENTO'] := cds_Temp.FieldByName('COMPLEMENTO').AsString;
    No.ChildValues['BAIRRO'] := cds_Temp.FieldByName('BAIRRO').AsString;
    No.ChildValues['CIDADE'] := cds_Temp.FieldByName('CIDADE').AsString;
    No.ChildValues['ESTADO'] := cds_Temp.FieldByName('ESTADO').AsString;
    No.ChildValues['PAIS'] := cds_Temp.FieldByName('PAIS').AsString;
    XMLDocument.SaveToFile(ExtractFileDir(Application.ExeName) + '\temp.xml');
  finally
    XMLDocument.Free;
  end;

  // ENVIA O E-MAIL
  Corpo := GerarCorpoEmail;
  Titulo := 'Dados de cadastro na Info';
  EnviarEmail(edt_usuario.Text,edt_senha.Text,edt_Endereco.Text,Titulo,Corpo);
end;



procedure Tf_principal.Button2Click(Sender: TObject);
var
  HTTP: TIdHTTP;
  vCEPLimpo : string;
  RetornoAPI : string;
  Json : TJSONObject;
  JSonValue : TJSonValue;

begin
  if cds_Temp.FieldByName('CEP').IsNull then

    Application.MessageBox('Favor informar um CEP antes de consultar os dados.','Atenção',MB_OK)

  else
  begin
    // Cria e configura o IdHTTP
    HTTP:= TIdHTTP.Create(self);
    HTTP.Request.UserAgent := 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0';

    // Obtem o CEP para busca
    vCEPLimpo := cds_Temp.FieldByName('CEP').AsString;
    vCEPLimpo := StringReplace(vCEPLimpo,'.','',[rfReplaceAll]);
    vCEPLimpo := StringReplace(vCEPLimpo,'-','',[rfReplaceAll]);
    try
      RetornoAPI := HTTP.Get('http://viacep.com.br/ws/' + vCEPLimpo + '/json/');
      Json := TJSONObject.Create;
      JsonValue := Json.ParseJSONValue(RetornoAPI);
    except
      on E:EIdHTTPProtocolException do
        Application.MessageBox('CEP inválido. Verifique o CEP digitado.','Atenção',MB_OK);
    end;

    if (JsonValue as TJSONObject).Get('erro').JSONValue.Value = 'true' then
    begin
      Application.MessageBox('O CEP informado não existe.','Atenção',mrOk);
    end
    else
    begin
      // Altera as informações no cadastro conforme Json de retorno
      cds_Temp.FieldByName('LOGRADOURO').AsString  := (JsonValue as TJSONObject).Get('logradouro').JSONValue.Value;
      cds_Temp.FieldByName('COMPLEMENTO').AsString := (JsonValue as TJSONObject).Get('complemento').JSONValue.Value;
      cds_Temp.FieldByName('BAIRRO').AsString      := (JsonValue as TJSONObject).Get('bairro').JSONValue.Value;
      cds_Temp.FieldByName('CIDADE').AsString      := (JsonValue as TJSONObject).Get('localidade').JSONValue.Value;
      cds_Temp.FieldByName('ESTADO').AsString      := (JsonValue as TJSONObject).Get('uf').JSONValue.Value;
    end;

    // Destroi os objetos criados
    HTTP.Destroy;
    Json.Destroy;
    JsonValue.Destroy;
  end;

end;

procedure Tf_principal.EnviarEmail(username, password, endereco, titulo,
  corpo: string);
var
  IdMessage1                    : TIdMessage;
  IdSMTP1                       : TIdSMTP;
  IdSSLIOHandlerSocketOpenSSL1 : TIdSSLIOHandlerSocketOpenSSL;
  IdAttachmentFile: TIdAttachmentFile;
  IdAttachmentMemory: TIdAttachmentMemory;
begin
  IdSMTP1 := TIdSMTP.Create(nil);
  IdMessage1 := TIdMessage.Create(nil);
  IdSSLIOHandlerSocketOpenSSL1 := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Method := sslvTLSv1;
  IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Mode := sslmUnassigned;
  IdSSLIOHandlerSocketOpenSSL1.SSLOptions.VerifyMode := [];
  IdSSLIOHandlerSocketOpenSSL1.SSLOptions.VerifyDepth := 0;
  IdMessage1.From.Address := username;
  IdMessage1.Recipients.EMailAddresses := endereco;
  IdMessage1.Subject := titulo;
  IdMessage1.Body.Text := corpo;
  IdAttachmentFile := TIdAttachmentFile.Create(IdMessage1.MessageParts, ExtractFileDir(Application.ExeName) + '\temp.xml');
  IdAttachmentMemory := TIdAttachmentMemory.Create(IdMessage1.MessageParts);
  IdSMTP1.IOHandler := IdSSLIOHandlerSocketOpenSSL1;
  IdSMTP1.Host := 'smtp.gmail.com';
  IdSMTP1.Port := 587;
  IdSMTP1.Username := username;
  IdSMTP1.Password := password;
  IdSMTP1.UseTLS := utUseExplicitTLS;
  IdSMTP1.Connect;
  IdSMTP1.send(IdMessage1);
  IdSMTP1.Disconnect;
  IdSMTP1.Free;
  IdMessage1.Free;
  IdSSLIOHandlerSocketOpenSSL1.Free;
end;

function Tf_principal.GerarCorpoEmail: string;
var
  Corpo: string;
begin
  Corpo := 'Nome: #NOME' + #13 +
           'Identidade: #IDENTIDADE' + #13 +
           'CPF: #CPF' + #13 +
           'Telefone: #TELEFONE' + #13 +
           'Email: #EMAIL' + #13 +
           'Endereço: ' + #13 +
           '   Cep: #CEP' + #13 +
           '   Logradouro: #LOGRADOURO' + #13 +
           '   Número: #NUMERO' + #13 +
           '   Complemento: #COMPLEMENTO' + #13 +
           '   Bairro: #BAIRRO' + #13 +
           '   Cidade: #CIDADE' + #13 +
           '   Estado: #ESTADO' + #13 +
           '   Pais: #PAIS';

  Corpo := StringReplace(Corpo,'#NOME',cds_Temp.FieldByName('NOME').AsString,[rfReplaceAll]);
  Corpo := StringReplace(Corpo,'#IDENTIDADE',cds_Temp.FieldByName('IDENTIDADE').AsString,[rfReplaceAll]);
  Corpo := StringReplace(Corpo,'#CPF',cds_Temp.FieldByName('CPF').AsString,[rfReplaceAll]);
  Corpo := StringReplace(Corpo,'#TELEFONE',cds_Temp.FieldByName('TELEFONE').AsString,[rfReplaceAll]);
  Corpo := StringReplace(Corpo,'#EMAIL',cds_Temp.FieldByName('EMAIL').AsString,[rfReplaceAll]);
  Corpo := StringReplace(Corpo,'#CEP',cds_Temp.FieldByName('CEP').AsString,[rfReplaceAll]);
  Corpo := StringReplace(Corpo,'#LOGRADOURO',cds_Temp.FieldByName('LOGRADOURO').AsString,[rfReplaceAll]);
  Corpo := StringReplace(Corpo,'#NUMERO',cds_Temp.FieldByName('NUMERO').AsString,[rfReplaceAll]);
  Corpo := StringReplace(Corpo,'#COMPLEMENTO',cds_Temp.FieldByName('COMPLEMENTO').AsString,[rfReplaceAll]);
  Corpo := StringReplace(Corpo,'#BAIRRO',cds_Temp.FieldByName('BAIRRO').AsString,[rfReplaceAll]);
  Corpo := StringReplace(Corpo,'#CIDADE',cds_Temp.FieldByName('CIDADE').AsString,[rfReplaceAll]);
  Corpo := StringReplace(Corpo,'#ESTADO',cds_Temp.FieldByName('ESTADO').AsString,[rfReplaceAll]);
  Corpo := StringReplace(Corpo,'#PAIS',cds_Temp.FieldByName('PAIS').AsString,[rfReplaceAll]);

  result := Corpo;
end;

end.
