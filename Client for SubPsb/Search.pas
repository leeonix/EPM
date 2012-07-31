unit Search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,comobj, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls,dm,pubvar;


type
  Tfrm_search = class(TForm)
    btn_find: TButton;
    btn_clearcondition: TButton;
    btn_close: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CheckBox1: TCheckBox;
    Datefield: TComboBox;
    dtp_begin: TDateTimePicker;
    dtp_end: TDateTimePicker;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    employee: TComboBox;
    cbx_employee: TComboBox;
    prjcontent: TComboBox;
    cbx_simbol: TComboBox;
    edt_content: TEdit;
    Lb_condition: TListBox;
    btn_add: TButton;
    btn_delete: TButton;
    btn_export: TButton;
    procedure btn_closeClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure btn_findClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btn_clearconditionClick(Sender: TObject);
    procedure btn_addClick(Sender: TObject);
    procedure btn_deleteClick(Sender: TObject);
    procedure edt_contentKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbx_employeeEnter(Sender: TObject);
    procedure btn_exportClick(Sender: TObject);
  private
    DatefieldList:TstringList;   //���ڲ�ѯ�ֶ��б�,���û�ѡ��Ҫ��ѯ�������ֶ�
    employeeList:TstringList;    //���̲�����Ա�б�,���û�ѡ��Ҫ��ѯ����Ա
    prjcontentlist:TstringList;  //�����й������ֶ��б�,���û�ѡ��Ҫ��ѯ�Ĺ��������ֶ�
    CustomerizList:TstringList;  //��¼�û��Զ����ѯ����������Sql���where�����Ӿ�
    procedure InitFieldBox(Tagetcombobox: Tcombobox) ;
    procedure GeTfield(TagetComBobox:Tcombobox;FieldType:string);
    function  TranslatetoSql(Index:Integer):string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_search: Tfrm_search;

implementation

uses searchtree, exportfield;

{$R *.dfm}

procedure Tfrm_search.btn_closeClick(Sender: TObject);
begin
  Close;
end;

// ����ͬ����Ч�Բ���
procedure Tfrm_search.CheckBox1Click(Sender: TObject);
begin
  Datefield.Enabled :=       Checkbox1.Checked;
  Dtp_Begin.Enabled :=       Checkbox1.Checked;
  Dtp_End.Enabled :=         Checkbox1.Checked;
end;

procedure Tfrm_search.CheckBox2Click(Sender: TObject);
begin
  Employee.Enabled := CheckBox2.Checked;
  Cbx_Employee.Enabled := CheckBox2.Checked;
end;

procedure Tfrm_search.CheckBox3Click(Sender: TObject);
begin
  prjcontent.Enabled:= CheckBox3.Checked;
  cbx_simbol.Enabled:=CheckBox3.Checked;
  edt_content.Enabled:= CheckBox3.Checked;
  Lb_condition.Enabled:=CheckBox3.Checked;
  btn_add.Enabled:=CheckBox3.Checked;
  btn_delete.Enabled:=CheckBox3.Checked;
end;

//��ȡĿ����������ֶ��б�
procedure Tfrm_search.GeTfield(TagetComBobox: Tcombobox;
  FieldType: string);
var  cSQL:String;
     fieldLists:Tstringlist;
begin
  cSQL:='Select * from FieldName where fieldType='''+FieldType+'''';
  QryWork(dm_epm.adoqry_pub,Csql);
  TagetComBobox.Clear;
  fieldLists:=TstringList.Create;
  try
    with dm_epm.adoqry_pub do
    begin
      While not Eof do
      begin
        fieldLists.Add(FieldByName('fieldcode').AsString);
        TagetComBobox.Items.Add(FieldByName('DisplayName').AsString);
        Next;
      end;
      if TagetComBobox.Name='Datefield'then
         DatefieldList.AddStrings(fieldLists)
      else if TagetComBobox.Name='employee' then employeeList.AddStrings(fieldLists)
      else  prjcontentlist.AddStrings(fieldLists);
    end;
  finally
    fieldLists.Free;
  end;
end;

//��ʼ����ѯ�ֶ��������б�
procedure Tfrm_search.InitFieldBox(Tagetcombobox: Tcombobox);
var cTemp:string;
begin
  GeTfield(TagetComBobox,TagetComBobox.Name);
  TagetComBobox.ItemIndex:=0;
end;

// �����û������Ĳ�ѯ����ѡ������sql���,ִ�в�ѯ����
procedure Tfrm_search.btn_findClick(Sender: TObject);
var CSql,strCondition,strcorp:string;
    I:Integer;
begin
  strCondition:='';
  strcorp :=  Framtree_Search.Fcorpcode;
  if strcorp='' then strcorp:=CurCorpCode;
  CsQl:='select * from projectinfo inner join flownodeinfo on prjcode=xmdm ';
  Csql:=Csql+'inner join projecttype on prjtype=PRJTYPECODE';
  Csql:=Csql+' left join designinfo on projectinfo.prjcode=designinfo.prjcode'
         +' LEFT JOIN budget on projectinfo.prjcode=budget.prjcode ';
  Csql:=Csql+' where activeflag<>''0'' and activeflag<>''3'' and flag<>''1'' and flag<>''4'' and corpcode='''+strcorp+'''';
  if CheckBox1.Checked then
    strCondition:=strCondition+ Format(' and %s>=''%s'' and %s<=''%s''', [DatefieldList.Strings[Datefield.ItemIndex],
           datetostr(dtp_begin.date),DatefieldList.Strings[Datefield.ItemIndex],datetostr(dtp_end.date)]);
  if CheckBox2.Checked then
    strCondition:=strCondition+Format(' and %s=''%s''',[employeeList.strings[employee.ItemIndex],cbx_employee.text]);
  if CheckBox3.Checked then
  begin
    for I:=0 to  CustomerizList.Count-1 do
    strCondition:=strCondition+ CustomerizList[I]
  end;
  if strCondition='' then
  begin
     MessageBox(self.Handle,'������һЩ��������','���ҹ���'
                                ,MB_OK+MB_ICONWARNING);
     exit;
  end;
  Csql:=csql+strCondition;
  QryWork(Dm_epm.adoqry_pub,Csql);
  if not Dm_epm.adoqry_pub.IsEmpty then
     Framtree_Search.ListFindResult
   else Showmessage('û���ҵ����������Ľ����������������������');
  btn_export.Enabled:=true;

end;

procedure Tfrm_search.FormCreate(Sender: TObject);
begin
  DatefieldList:=TstringList.Create;
  employeeList:=Tstringlist.Create;
  prjcontentlist:=Tstringlist.Create;
  CustomerizList:=TstringList.Create;
  dtp_begin.Date:=date-30;
  dtp_end.Date:=date;
  InitFieldBox(Tcombobox(Datefield));
  InitFieldBox(Tcombobox(employee));
  InitFieldBox(Tcombobox(prjcontent));
   btn_export.Enabled:=false;
end;

//�ͷ�stringlistʵ���Ա��ͷ��ڴ�
procedure Tfrm_search.FormDestroy(Sender: TObject);
begin
   DatefieldList.Free;
   employeeList.Free;
   prjcontent.Free;
   CustomerizList.Free;
end;

// ��յ�ǰ�����Ĳ�ѯ�����Ա����¿�ʼѡ���ѯ����
procedure Tfrm_search.btn_clearconditionClick(Sender: TObject);
begin
  if checkbox1.Checked then
  begin
   Datefield.ItemIndex:=-1;
   dtp_begin.Date:=date-30;
   dtp_end.Date:=date;
  end;
  if checkbox2.Checked then
  begin
    employee.ItemIndex:=-1;
    cbx_employee.ItemIndex:=-1;
  end;
  if checkbox3.Checked then
  begin
     CustomerizList.Clear;
     Lb_condition.Items.Clear;
  end;
end;

//���û������Ĳ�ѯ����ѡ����ӵ��Զ����б����,ͬʱӳ���sql��䲢�Լ�¼
procedure Tfrm_search.btn_addClick(Sender: TObject);
var Sqlstatment:string;
begin
  if (prjcontent.ItemIndex>-1) and (trim(cbx_simbol.Text)<>'') and
                  (trim(edt_content.Text)<>'') then
  begin
    Lb_condition.Items.Add(trim(prjcontent.Text)+trim(cbx_simbol.Text)+trim(edt_content.Text));
    Sqlstatment:=TranslatetoSql(prjcontent.ItemIndex);
    CustomerizList.Add(Sqlstatment);
    btn_delete.Enabled:=true;
  end;
end;


procedure Tfrm_search.btn_deleteClick(Sender: TObject);
begin
  if  Lb_condition.ItemIndex>-1 then
  begin
    CustomerizList.Delete(Lb_condition.ItemIndex);
    Lb_condition.DeleteSelected;
  end;
  btn_delete.Enabled:=Lb_condition.Count>0
end;

procedure Tfrm_search.edt_contentKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if edt_content.Text<>'' then
    btn_add.Enabled:=true;
end;

//ӳ��sql���
function Tfrm_search.TranslatetoSql(Index: Integer): string;
var Sqlstatment:string;
begin
  Sqlstatment:=' and '+prjcontentList[prjcontent.ItemIndex];
  case cbx_simbol.ItemIndex of
    0:Sqlstatment:=Sqlstatment+' = '''+trim(edt_content.Text)+'''';
    1:Sqlstatment:=Sqlstatment+' like ''%'+trim(edt_content.Text)+'%''';
  end;
  Result:=Sqlstatment;
end;

// ������Ա��ѡҪ��ѯ���ֶεĹ�����ɫɸѡ�ɹ��û�ѡ���ְԱ
procedure Tfrm_search.cbx_employeeEnter(Sender: TObject);
var  cSQL:String;
begin
  cSQL:= 'Select distinct(employeename) from employee a inner join compose b on a.jobcode=b.jobcode '
         +'inner join jobrole c on b.rolid=c.rolid where '
         +' corpcode='''+CurCorpCode+'''';
  if employee.Text<>'��ǰִ����' then
  csql := csql + ' and c.rolename='''+trim(employee.Text)+'''' ;
  QryWork(dm_epm.adoqry_pub,Csql);
  if dm_epm.adoqry_pub.IsEmpty then
  begin
     cSQL:='Select distinct(employeename) from employee a inner join compose b on a.jobcode=b.jobcode '
       +'inner join jobrole c on b.rolid=c.rolid where '
        +' c.rolename<>''vip'' order by employeename where corpcode='''+CurCorpCode+'''';
     QryWork(dm_epm.adoqry_pub,Csql);
  end;
  cbx_employee.Clear;
  with dm_epm.adoqry_pub do
  begin
    While not Eof do
    begin
      cbx_employee.Items.Add(FieldByName('employeename').AsString);
      Next;
    end;
  end;
end;

//����ѯ��������EXCEL ���
procedure Tfrm_search.btn_exportClick(Sender: TObject);
var templist,Namelist:Tstringlist;
    FieldCount,rr,recordcount,j,I:integer;
    app:olevariant;
begin
   application.CreateForm(Tfrm_export,frm_export);
   try
     if frm_export.ShowModal=mrok then
     begin
       templist:=frm_export.fieldlist;
       namelist:=frm_export.DisplayList;
       try
        app:=createoleobject('excel.application');
        except
          messagedlg('Excel û����ȷ��װ!',mterror,[mbok],0);
          exit;
        end;
        screen.Cursor := crHourGlass;
        app.workbooks.add;

        dm_epm.adoqry_pub.first;
        FieldCount:=templist.Count;
        rr:=1;
        RecordCount:=dm_epm.adoqry_pub.recordcount;
        //�������̧ͷ
        app.cells(rr+1,1):='���';
        for I:=0 to namelist.Count-1 do
        begin
           app.cells(rr+1,i+2):=Namelist[I];
        end;
        for j:=1 to Recordcount do
        begin
          for i:=0 to FieldCount-1 do
          begin
           app.cells(rr+2,i+2):=dm_epm.adoqry_pub.FieldByName(templist[I]).AsString;
           app.cells(rr+2,1):=j;
          end;
          dm_epm.adoqry_pub.next;
          inc(rr);
        end;
        screen.Cursor := crDefault;
        app.cells.select;
        app.Selection.Columns.AutoFit;
        app.rows[2].select;
        app.selection.font.bold:=true;
        app.visible:=true;
     end;
   finally
     frm_export.Free;
   end;
end;

end.
