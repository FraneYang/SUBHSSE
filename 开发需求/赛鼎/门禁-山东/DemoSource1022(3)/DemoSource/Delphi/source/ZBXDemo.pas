unit ZBXDemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,libFaceRecognitionSDK_x86, ExtCtrls;

type
  TForm1 = class(TForm)
    edtDevIP: TEdit;
    Button1: TButton;
    Label1: TLabel;
    pnlVideo1: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pnlVideo1Click(Sender: TObject);
    function GetVideo1Handle() :Integer;
    procedure onDestory(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  strIP, strUser, strPwd: PChar;
  mPort: Word;
  mHandle : ZBX_CamHandle;
  error_code :Integer;
  channel : Integer;
  mRet: Integer;
  m_sUserPwd : string;
  
begin
  strIP := PChar(edtDevIP.Text);
  strUser := '11';
  strPwd := '11';
  mPort := 8099;
  m_sUserPwd := '123';
  channel :=0;
  mHandle := ZBX_ConnectEx(strIP, mPort, strUser, strPwd,error_code,channel,1);
  if mHandle = 0 then
  begin
    ShowMessage('设备打开失败，请检查登录信息!');
  end
  else
  begin
    ShowMessage('设备打开成功！！！');
    ZBX_StartStream(mHandle,pnlVideo1.Handle);
  end
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  //引用DLL库
  LoadBusModule();
  //SDK初始化
  ZBX_Init();
  pnlVideo1.Tag := 0;
end;

procedure TForm1.pnlVideo1Click(Sender: TObject);
begin

end;

//获取视频窗口1句柄
function TForm1.GetVideo1Handle() :Integer;
begin
  if (pnlVideo1.Tag <> 0) then
  begin
    Result := pnlVideo1.Tag;
  end
  else
  begin
    Result := 0;
  end;
end;

procedure TForm1.onDestory(Sender: TObject);
begin
  ZBX_DeInit();
end;

end.                             
