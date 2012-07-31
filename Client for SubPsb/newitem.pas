unit Newitem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,prj_jgys,
  StdCtrls,ComCtrls,Framdgwt,newprj,NewDesignPrj,newygprj,baseinfo_xt,dm,pubvar,Prj_bdys,kybg,
  ExtCtrls;

type
  TFrm_New = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    Fram_dg:TFram_dg;
    Fram_newprj:TFram_newprj;
    Fram_newnbprj:TFram_newnbprj;
    Fram_newygprj:TFram_newygprj;
    Frame_Jgys  :TFrame_Jgys;
    Frame_bdys:TFram_bdys;
    fram_kybg:Tfram_kybg;
    fram_designPrj:Tfram_designprj;
    procedure Init(const ctype,Prjcode:string;source:string='');
    { Public declarations }
  end;

var
  Frm_New: TFrm_New;

implementation





{$R *.DFM}

{ TFrmnew }

procedure TFrm_New.Init(const ctype,Prjcode:string; source:string='');
var I:integer;
begin
   if ctype='DGXM' then      //新建代工工程
   begin
      Fram_dg:=TFram_dg.Create(self);
      Fram_dg.Parent := self;
      Fram_dg.DGtype := 2;
      self.Height := Fram_dg.Height+60;
      self.Width := Fram_dg.Width+8;
      Fram_dg.Align := alclient;
      Fram_dg.Visible := true;
      Fram_dg.InputMode := NewMode;       //置界面为新建模式
      Fram_dg.TabSheet2.Enabled := false;
      Fram_dg.TabSheet3.Enabled := false;
      Fram_dg.SQDATE.DateTime := gettime;
      Fram_dg.SLYYY.Text := loginuser;
   end else
   if ctype='DGXM_ld' then      //新建路灯工程
   begin
      Fram_dg:=TFram_dg.Create(self);
      Fram_dg.Parent := self;
      Fram_dg.DGtype := 3;
      self.Height := Fram_dg.Height+60;
      self.Width := Fram_dg.Width+8;
      Fram_dg.Align := alclient;
      Fram_dg.Visible := true;
      Fram_dg.InputMode := NewMode;       //置界面为新建模式
      Fram_dg.TabSheet2.Enabled := false;
      Fram_dg.TabSheet3.Enabled := false;
      Fram_dg.SQDATE.DateTime := gettime;
      Fram_dg.SLYYY.Text := loginuser;
   end else
   if ctype='yggc' then                     //新建用改工程
   begin
      Fram_newygprj := TFram_newygprj.Create(self);
      Fram_newygprj.Parent := self;
      self.Height := Fram_newygprj.Height+60;
      self.Width := Fram_newygprj.Width+8;
      Fram_newygprj.Align:=alclient;
      Fram_newygprj.ParentPrj := Source;
      Fram_newygprj.CreateNew;
      Fram_newygprj.InputMode:=NewMode;
       Fram_newygprj.Visible:=true;
   end else
   if ctype='subdyprj' then                     //新建子工程（电业）
   begin
      Fram_newnbprj := TFram_newnbprj.Create(self);
      Fram_newnbprj.Parent := self;
      self.Height := Fram_newnbprj.Height+60;
      self.Width := Fram_newnbprj.Width+8;
      Fram_newnbprj.Align:=alclient;
      Fram_newnbprj.ParentPrj := Source;
      Fram_newnbprj.Createsubprj;
      Fram_newnbprj.InputMode:=SubNewMode;
      Fram_newnbprj.Visible:=true;
   end else
   if ctype='subykprj' then                     //新建子工程（业扩）
   begin
      Fram_newprj := TFram_newprj.Create(self);
      Fram_newprj.Parent := self;
      self.Height := Fram_newprj.Height+60;
      self.Width := Fram_newprj.Width+8;
      Fram_newprj.Align:=alclient;
      Fram_newprj.ParentPrj := Source;
      Fram_newprj.Createsubprj;
      Fram_newprj.InputMode:=SubNewMode;
      Fram_newprj.Visible:=true;
   end else
   if ctype='subdgprj' then                     //新建子工程（代工）
   begin
      Fram_dg := TFram_dg.Create(self);
      Fram_dg.Parent := self;
      Fram_dg.DGtype := 6;
      self.Height := Fram_dg.Height+60;
      self.Width := Fram_dg.Width+8;
      Fram_dg.Align:=alclient;
      Fram_dg.parentcode := Prjcode; //工程代码作为子工程的父工程代码
      Fram_dg.ParentPrj := Source ;  //
      Fram_dg.Createsubprj;
      Fram_dg.InputMode:=SubNewMode;
      Fram_dg.Visible:=true;

   end else
   if (ctype='ykgc') or (ctype='ykgc_pm') or (ctype='ykgc_pt') then        //新建业扩工程
   begin
      Fram_newprj:=TFram_newprj.Create(self);

      Fram_newprj.Parent:=self;
      self.Height := Fram_newprj.Height+60;
      if ctype='ykgc' then Fram_newprj.Yktype :=0
     // else if ctype='ykgc_mg' then Fram_newprj.Yktype :=5
      else if ctype='ykgc_pt' then Fram_newprj.Yktype :=5
      else if ctype='ykgc_pm' then
      begin
       Fram_newprj.Yktype :=4;
     //  Fram_newprj.Panel2.Visible:= True;
      // self.Height := Fram_newprj.Height+114;
      end ;
      Fram_newprj.FillInProjectType;
      self.Width := Fram_newprj.Width+12;
      Fram_newprj.Align:=alclient;
      Fram_newprj.yysfrq.Enabled := false;
      Fram_newprj.yysfje.Enabled := false;
     // Fram_newprj.Panel1.Visible:=false;
     // Fram_newprj.SpeedButton1.Visible:=false;
      Fram_newprj.Visible := true;
      Fram_newprj.inputmode := newmode;
      Fram_newprj.SLYYY.Text := loginuser;

   end;
   if ctype='nbgc' then                //新建内部工程
   begin
      Fram_newnbprj:=TFram_newnbprj.Create(self);
      Fram_newnbprj.Parent:=self;
      self.Height:=Fram_newnbprj.Height+60;
      self.Width:=Fram_newnbprj.Width+8;
      Fram_newnbprj.Align:=alclient;
      Fram_newnbprj.Visible:=true;
      Fram_newnbprj.inputmode:=newmode;
   end;
   if ctype='designprj' then                //新建设计委托工程
   begin
      fram_designPrj:=Tfram_designPrj.Create(self);
      fram_designPrj.Parent:=self;
      self.Height:=fram_designPrj.Height+60;
      self.Width:=fram_designPrj.Width+8;
      fram_designPrj.Align:=alclient;
      fram_designPrj.Visible:=true;
      fram_designPrj.inputmode:=newmode;
   end;
   if ctype='ysbg' then
   if source='线路' then             //新建验收报告
   begin
      Frame_Jgys := TFrame_Jgys.Create(self);
      Frame_Jgys.Parent := self;
      self.Height := Frame_Jgys.Height+60;
      self.Width := Frame_Jgys.Width+8;
      Frame_Jgys.Align:=alclient;
      Frame_Jgys.Init(prjcode,source);
      Frame_Jgys.Visible:=true;
      Frame_Jgys.inputmode:=EditMode;
   end else
   begin
      Frame_bdys := TFram_bdys.Create(self);
      Frame_bdys.Parent := self;
      self.Height := Frame_bdys.Height+60;
      self.Width := Frame_bdys.Width+8;
      Frame_bdys.Align:=alclient;
      Frame_bdys.Init(prjcode);
      Frame_bdys.Visible:=true;
      Frame_bdys.inputmode:=EditMode;
   end;
   if ctype='kysb' then
   begin
      Fram_kybg:=Tfram_kybg.Create(self);
      fram_kybg.Parent:=self;
      self.Height:=fram_kybg.Height+60;
      self.Width:=fram_kybg.Width+8;
      fram_kybg.Align:=alclient;
      fram_kybg.Visible:=true;
      fram_kybg.inputmode:=newmode;
   end;
end;

procedure TFrm_New.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key=#13) and not (self.ActiveControl  is TRichedit) then
     self.SelectNext(self.ActiveControl,true,true);
end;

// 根据当前加载的内容类别保存信息
procedure TFrm_New.Button1Click(Sender: TObject);
begin
  if Fram_dg<>nil then
  begin
     if Fram_dg.SaveInfo  then
     ModalREsult:=mrok;
  end
  else if Fram_newprj<>nil then
  begin
     if Fram_newprj.SaveInfo then
     ModalREsult:=mrok;
  end
  else if Fram_NewNbPrj<>nil then
  begin
    if  Fram_NewNbPrj.SaveInfo then
     ModalREsult:=mrok;
  end
  else if Fram_newygprj<>nil then
  begin
     if Fram_newygprj.SaveInfo then
          ModalREsult:=mrok;
  end
  else if Frame_Jgys<>nil then
  begin
    if  Frame_Jgys.SaveInfo then
     ModalREsult:=mrok;
  end
  else if Frame_bdys<>nil then
  begin
    if  Frame_bdys.SaveInfo then
     ModalREsult:=mrok;
  end
  else if fram_designPrj<>nil then
  begin
    if  fram_designPrj.SaveInfo then
     ModalREsult:=mrok;
  end
  else if Fram_kybg<>nil then
  begin
    if  not Fram_kybg.Saved then
     if  Fram_kybg.SaveInfo then
      ModalREsult:=mrok;
  end
end;

//打印竣工验收单 。
procedure TFrm_New.Button3Click(Sender: TObject);
begin
 if Frame_Jgys<>nil then
     Frame_Jgys.PrintBod;
 if Frame_bdys<>nil then
     Frame_bdys.PrintBod;     

end;

end.
