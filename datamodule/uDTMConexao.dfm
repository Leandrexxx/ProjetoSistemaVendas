object dtmConexao: TdtmConexao
  OldCreateOrder = False
  Height = 325
  Width = 568
  object fdConexao: TFDConnection
    Params.Strings = (
      'Database=C:\Users\leand\Documents\BANCO DE DADOS\LEANDRO.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=localhost'
      'Port=3050'
      'CharacterSet=UTF8'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 200
    Top = 64
  end
end
