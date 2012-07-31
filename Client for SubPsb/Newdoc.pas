unit NewDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, DBCtrls, Mask,dm,pubvar,engdoc;

type
  TFrm_NewDoc = class(TForm)
    Button1: TButton;
    Button2: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;        
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBComboBox3: TDBComboBox;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    filename:string;
    { Public declarations }
  end;

var
  Frm_NewDoc: TFrm_NewDoc;

implementation


{$R *.dfm}

procedure TFrm_NewDoc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    SelectNext(ActiveControl,True,True);
end;

procedure TFrm_NewDoc.Button1Click(Sender: TObject);
begin
   if trim(DBEdit1.Text)='' then
   begin
     showmessage('请输入图纸名称');
     DBEdit1.SelectAll;
     DBEdit1.SetFocus;
     exit;
   end else
   if trim(DBComboBox1.Text)='' then
   begin
     showmessage('请选择图档类别');
     DBComboBox1.SelectAll;
     DBComboBox1.SetFocus;
     exit;
   end else
   if trim(DBEdit3.Text)='' then
   begin
     showmessage('请输入作者名称');
     DBEdit3.SelectAll;
     DBEdit3.SetFocus;
     exit;
   end;
   filename:=filepath+trim(dbedit3.Text)+'\'+trim(DBComboBox1.Text)
             +'\'+trim(DBEdit1.Text);
   modalresult:=mrok;
end;

end.
