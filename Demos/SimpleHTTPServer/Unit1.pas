unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  IdBaseComponent, IdComponent, IdCustomTCPServer, IdTCPServer, Vcl.StdCtrls,
  IdContext, IdCustomHTTPServer, IdHTTPServer, IdUDPBase, IdUDPServer,
  IdTrivialFTPServer, System.Classes;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    efPath: TEdit;
    IdHTTPServer1: TIdHTTPServer;
    procedure IdHTTPServer1CommandGet(AContext: TIdContext; ARequestInfo:
        TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    procedure IdHTTPServer1Connect(AContext: TIdContext);
    procedure IdHTTPServer1Disconnect(AContext: TIdContext);
  private
    fMemStream: TMemoryStream;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  System.IOUtils;

{$R *.dfm}

procedure TForm1.IdHTTPServer1CommandGet(AContext: TIdContext; ARequestInfo:
    TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
  filename: string;
  fullPath: string;
  memStream: TMemoryStream;
begin
  Memo1.Lines.Add('URL: ' + ARequestInfo.URI);
  filename:=ARequestInfo.URI.Replace('/', '');
  Memo1.Lines.Add('Filename: ' + filename);

  fullPath:= TPath.Combine(efPath.Text, filename);
  if not FileExists(fullPath) then
  begin
    AResponseInfo.ResponseText:=fullPath + ' does not exist';
    AResponseInfo.ResponseNo:=404;
    Exit;
  end;

  try
    fMemStream.LoadFromFile(fullPath);
    AResponseInfo.ContentStream := fMemStream;
    AResponseInfo.ContentType:='text';
    AResponseInfo.ResponseNo:=200;
  except

  end;
end;

procedure TForm1.IdHTTPServer1Connect(AContext: TIdContext);
begin
  Memo1.Lines.Add('Server Connected');
  fMemStream:=TMemoryStream.Create;
end;

procedure TForm1.IdHTTPServer1Disconnect(AContext: TIdContext);
begin
  Memo1.Lines.Add('Server Disconnected');
  fMemStream.Free;
end;

end.
