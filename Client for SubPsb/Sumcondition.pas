unit Sumcondition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,dm, ComCtrls,pubvar;

type
  Tfrm_sumcondition = class(TForm)
    Cb_depart: TComboBox;
    cb_employee: TComboBox;
    Bevel1: TBevel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    RadioGroup1: TRadioGroup;
    dtp_begin: TDateTimePicker;
    dtp_end: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    cb_type: TComboBox;
    CheckBox4: TCheckBox;
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cb_employeeEnter(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
  private
    { Private declarations }
  public

    
    { Public declarations }
  end;

var
  frm_sumcondition: Tfrm_sumcondition;

implementation

{$R *.dfm}

procedure Tfrm_sumcondition.CheckBox1Click(Sender: TObject);
begin
 cb_depart.Enabled := checkbox1.Checked;
end;

procedure Tfrm_sumcondition.CheckBox2Click(Sender: TObject);
begin
   cb_employee.Enabled := checkbox2.Checked;
end;

procedure Tfrm_sumcondition.FormCreate(Sender: TObject);
var cSql:string;
begin
  cSQL:='Select distinct(department) from employee where corpcode='''+CurCorpCode+''' ';
  QryWork(dm_epm.adoqry_pub,Csql);
  cb_depart.Clear;
  with dm_epm.adoqry_pub do
  begin
    While not Eof do
    begin
      cb_depart.Items.Add(FieldByName('department').AsString);
      Next;
    end;
  end;
  cSQL:='Select *  from projecttype ';
  QryWork(dm_epm.adoqry_pub,Csql);
  cb_type.Clear;
  with dm_epm.adoqry_pub do
  begin
    While not Eof do
    begin
      cb_type.Items.Add(FieldByName('typename').AsString);
      Next;
    end;
  end;
  dtp_begin.Date:=date-30;
  dtp_end.Date:=date;
end;

procedure Tfrm_sumcondition.cb_employeeEnter(Sender: TObject);
var cSql:string;
begin
   if cb_depart.Text<>'' then
   begin
     cSql:='select EMPLOYEENAME from employee where department='''+trim(cb_depart.Text)+''' and corpcode='''+CurCorpCode+'''';
     QryWork(dm_epm.adoqry_pub,Csql);
     cb_employee.Clear;
     with dm_epm.adoqry_pub do
     begin
       While not Eof do
       begin
         cb_employee.Items.Add(FieldByName('EMPLOYEENAME').AsString);
         Next;
       end;
     end;
   end;
end;

procedure Tfrm_sumcondition.CheckBox3Click(Sender: TObject);
begin
  dtp_begin.Enabled:=checkbox3.Checked;
  dtp_end.Enabled:=checkbox3.Checked;
end;

procedure Tfrm_sumcondition.CheckBox4Click(Sender: TObject);
begin
  cb_type.Enabled := checkbox4.Checked;
end;

end.
