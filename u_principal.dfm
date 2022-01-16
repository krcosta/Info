object f_principal: Tf_principal
  Left = -2137
  Top = 152
  BorderStyle = bsDialog
  Caption = 'Cadastro de Cliente - Info'
  ClientHeight = 501
  ClientWidth = 721
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 9
    Top = 34
    Width = 33
    Height = 13
    Caption = 'Nome'
    FocusControl = edt_Nome
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 483
    Top = 34
    Width = 61
    Height = 13
    Caption = 'Identidade'
    FocusControl = edt_Identidade
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 611
    Top = 34
    Width = 24
    Height = 13
    Caption = 'CPF'
    FocusControl = edt_Cpf
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 9
    Top = 76
    Width = 51
    Height = 13
    Caption = 'Telefone'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 162
    Top = 76
    Width = 35
    Height = 13
    Caption = 'E-mail'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 9
    Top = 122
    Width = 25
    Height = 13
    Caption = 'CEP'
    FocusControl = edt_Cep
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 139
    Top = 122
    Width = 65
    Height = 13
    Caption = 'Logradouro'
    FocusControl = edt_Logradouro
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 632
    Top = 122
    Width = 44
    Height = 13
    Caption = 'N'#250'mero'
    FocusControl = edt_Numero
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 9
    Top = 162
    Width = 76
    Height = 13
    Caption = 'Complemento'
    FocusControl = edt_Complemento
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 9
    Top = 202
    Width = 34
    Height = 13
    Caption = 'Bairro'
    FocusControl = edt_Bairro
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel
    Left = 364
    Top = 202
    Width = 40
    Height = 13
    Caption = 'Cidade'
    FocusControl = edt_Cidade
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label12: TLabel
    Left = 9
    Top = 242
    Width = 40
    Height = 13
    Caption = 'Estado'
    FocusControl = edt_Estado
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label13: TLabel
    Left = 55
    Top = 242
    Width = 27
    Height = 13
    Caption = 'Pa'#237's'
    FocusControl = edt_Pais
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object nav_Principal: TDBNavigator
    Left = 0
    Top = 0
    Width = 721
    Height = 25
    DataSource = dts_Principal
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel]
    Align = alTop
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 15
  end
  object edt_Nome: TDBEdit
    Left = 9
    Top = 50
    Width = 468
    Height = 19
    Ctl3D = False
    DataField = 'Nome'
    DataSource = dts_Principal
    ParentCtl3D = False
    TabOrder = 0
  end
  object edt_Identidade: TDBEdit
    Left = 483
    Top = 50
    Width = 120
    Height = 19
    Ctl3D = False
    DataField = 'Identidade'
    DataSource = dts_Principal
    ParentCtl3D = False
    TabOrder = 1
  end
  object edt_Cpf: TDBEdit
    Left = 609
    Top = 50
    Width = 103
    Height = 19
    Ctl3D = False
    DataField = 'CPF'
    DataSource = dts_Principal
    MaxLength = 14
    ParentCtl3D = False
    TabOrder = 2
  end
  object edt_Telefone: TDBEdit
    Left = 9
    Top = 92
    Width = 147
    Height = 19
    Ctl3D = False
    DataField = 'Telefone'
    DataSource = dts_Principal
    MaxLength = 13
    ParentCtl3D = False
    TabOrder = 3
  end
  object edt_Email: TDBEdit
    Left = 162
    Top = 92
    Width = 550
    Height = 19
    Ctl3D = False
    DataField = 'Email'
    DataSource = dts_Principal
    ParentCtl3D = False
    TabOrder = 4
  end
  object edt_Cep: TDBEdit
    Left = 9
    Top = 138
    Width = 101
    Height = 19
    Ctl3D = False
    DataField = 'CEP'
    DataSource = dts_Principal
    MaxLength = 10
    ParentCtl3D = False
    TabOrder = 5
  end
  object edt_Logradouro: TDBEdit
    Left = 139
    Top = 138
    Width = 487
    Height = 19
    Ctl3D = False
    DataField = 'Logradouro'
    DataSource = dts_Principal
    ParentCtl3D = False
    TabOrder = 7
  end
  object edt_Numero: TDBEdit
    Left = 632
    Top = 138
    Width = 80
    Height = 19
    Ctl3D = False
    DataField = 'Numero'
    DataSource = dts_Principal
    ParentCtl3D = False
    TabOrder = 8
  end
  object edt_Complemento: TDBEdit
    Left = 9
    Top = 178
    Width = 703
    Height = 19
    Ctl3D = False
    DataField = 'Complemento'
    DataSource = dts_Principal
    ParentCtl3D = False
    TabOrder = 9
  end
  object edt_Bairro: TDBEdit
    Left = 9
    Top = 218
    Width = 349
    Height = 19
    Ctl3D = False
    DataField = 'Bairro'
    DataSource = dts_Principal
    ParentCtl3D = False
    TabOrder = 10
  end
  object edt_Cidade: TDBEdit
    Left = 364
    Top = 218
    Width = 348
    Height = 19
    Ctl3D = False
    DataField = 'Cidade'
    DataSource = dts_Principal
    ParentCtl3D = False
    TabOrder = 11
  end
  object edt_Estado: TDBEdit
    Left = 9
    Top = 258
    Width = 40
    Height = 19
    Ctl3D = False
    DataField = 'Estado'
    DataSource = dts_Principal
    ParentCtl3D = False
    TabOrder = 12
  end
  object edt_Pais: TDBEdit
    Left = 55
    Top = 258
    Width = 151
    Height = 19
    Ctl3D = False
    DataField = 'Pais'
    DataSource = dts_Principal
    ParentCtl3D = False
    TabOrder = 13
  end
  object Button1: TButton
    Left = 586
    Top = 258
    Width = 126
    Height = 20
    Caption = 'Enviar e-mail'
    TabOrder = 14
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 110
    Top = 137
    Width = 29
    Height = 21
    TabOrder = 6
    OnClick = Button2Click
  end
  object GroupBox1: TGroupBox
    Left = 9
    Top = 296
    Width = 704
    Height = 197
    Caption = ' Configura'#231#245'es de E-mail '
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 16
    object Label14: TLabel
      Left = 16
      Top = 24
      Width = 79
      Height = 13
      Caption = 'Usu'#225'rio Gmail'
      FocusControl = edt_Logradouro
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 16
      Top = 64
      Width = 37
      Height = 13
      Caption = 'Senha'
      FocusControl = edt_Logradouro
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 16
      Top = 125
      Width = 174
      Height = 13
      Caption = 'Endere'#231'o para envio do e-mail'
      FocusControl = edt_Logradouro
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edt_usuario: TEdit
      Left = 16
      Top = 40
      Width = 273
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
    end
    object edt_senha: TEdit
      Left = 16
      Top = 80
      Width = 273
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
    object edt_Endereco: TEdit
      Left = 16
      Top = 144
      Width = 273
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
    end
    object Memo1: TMemo
      Left = 320
      Top = 24
      Width = 369
      Height = 153
      Lines.Strings = (
        'Para o envio de e-mail foi utilizado SMTP do Gmail.'
        'Instru'#231#245'es de configura'#231#227'o do Gmail:'
        ''
        'https://www.hostinger.com.br/tutoriais/aprenda-a-utilizar-o-'
        'smtp-google?'
        'ppc_campaign=google_performance_max&gclid=Cj0KCQiAoY-'
        'PBhCNARIsABcz771PCdwRrIPvLcjT-'
        'PuNcROcYyEp7sLraKplDfGp3M40TjubZn96cTcaApchEALw_wc'
        'B')
      ReadOnly = True
      TabOrder = 3
    end
  end
  object cds_Temp: TClientDataSet
    PersistDataPacket.Data = {
      710100009619E0BD01000000180000000D0000000000030000007101044E6F6D
      6501004900000001000557494454480200020096000A4964656E746964616465
      0100490000000100055749445448020002001E00034350460100490000000100
      055749445448020002000E000854656C65666F6E650100490000000100055749
      44544802000200140005456D61696C0100490000000100055749445448020002
      006400034345500100490000000100055749445448020002000A000A4C6F6772
      61646F75726F0100490000000100055749445448020002009600064E756D6572
      6F04000100000000000B436F6D706C656D656E746F0100490000000100055749
      44544802000200C8000642616972726F01004900000001000557494454480200
      0200640006436964616465010049000000010005574944544802000200640006
      45737461646F0100490000000100055749445448020002006400045061697301
      004900000001000557494454480200020064000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 474
    Top = 243
    object cds_TempNome: TStringField
      FieldName = 'Nome'
      Size = 150
    end
    object cds_TempIdentidade: TStringField
      FieldName = 'Identidade'
      Size = 30
    end
    object cds_TempCPF: TStringField
      FieldName = 'CPF'
      EditMask = '999.999.999-99;1;_'
      Size = 14
    end
    object cds_TempTelefone: TStringField
      FieldName = 'Telefone'
      EditMask = '!\(99\)9999-9999;1;_'
    end
    object cds_TempEmail: TStringField
      FieldName = 'Email'
      Size = 100
    end
    object cds_TempCEP: TStringField
      FieldName = 'CEP'
      EditMask = '99.999\-999;1;_'
      Size = 10
    end
    object cds_TempLogradouro: TStringField
      FieldName = 'Logradouro'
      Size = 150
    end
    object cds_TempNumero: TIntegerField
      FieldName = 'Numero'
    end
    object cds_TempComplemento: TStringField
      FieldName = 'Complemento'
      Size = 200
    end
    object cds_TempBairro: TStringField
      FieldName = 'Bairro'
      Size = 100
    end
    object cds_TempCidade: TStringField
      FieldName = 'Cidade'
      Size = 100
    end
    object cds_TempEstado: TStringField
      FieldName = 'Estado'
      Size = 2
    end
    object cds_TempPais: TStringField
      FieldName = 'Pais'
      Size = 100
    end
  end
  object dts_Principal: TDataSource
    DataSet = cds_Temp
    Left = 426
    Top = 243
  end
end
