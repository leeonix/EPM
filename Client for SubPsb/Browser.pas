unit Browser;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OleCtrls, SHDocVw, AppEvnts;

type
  TFram_Browser = class(TFrame)
    Wbrstask: TWebBrowser;
    procedure WbrstaskBeforeNavigate2(Sender: TObject;
      const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
      Headers: OleVariant; var Cancel: WordBool);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
  private
    { Private declarations }
  public
    procedure load();

    { Public declarations }
  end;

implementation

uses tasktree,main;


{$R *.DFM}

{ TFrambrowser }

procedure TFram_Browser.load;
var flags:OleVariant;
begin
  flags:= navOpenInNewWindow;
  wbrstask.Navigate(extractfilepath(application.ExeName)+'navtask.htm');
  //wbrstask.Navigate('http://10.31.191.249/userlogin.asp?username=libs&password=');
 // wbrstask.Navigate('http://192.168.0.99/cgy/Login.asp');
end;

procedure TFram_Browser.WbrstaskBeforeNavigate2(Sender: TObject;
  const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
  Headers: OleVariant; var Cancel: WordBool);
begin
   if URL='epmcmd:taskbox' then
   begin
     cancel:=true;
     framtree_task.Trvwdefaut.Items[1].Selected:=true;
   end;
   if url='epmcmd:modpwd' then
   begin                        
     cancel:= true;
     frm_main.Amodpwd.Execute;
   end;
   if url='epmcmd:browserprj' then
   begin
     cancel:= true;
     //frm_main;
   end;
   if url='epmcmd:newprj' then
   begin
     cancel:= true;
     //frm_main;
   end;
    if url='epmcmd:virtul' then
   begin
     cancel:= true;
     //frm_main;
   end;

end;

procedure TFram_Browser.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
//  if (Msg.message=WM_RBUTTONDOWN) or (Msg.message=WM_RBUTTONDBLCLK) then
//  Msg.message:=WM_NULL;
end;

end.
