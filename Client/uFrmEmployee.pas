unit uFrmEmployee;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
    Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids,
    Vcl.StdCtrls, Data.DB;

type
    TFrmEmployee = class(TForm)
        DBGrid1: TDBGrid;
        EdtName: TEdit;
        BtPesquisar: TButton;
        Label1: TLabel;
        dsEmployee: TDataSource;
        procedure BtPesquisarClick(Sender: TObject);
        procedure EditEmployee(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    FrmEmployee: TFrmEmployee;

implementation

{$R *.dfm}

uses
    uDMClient, uFrmEditEmployee;

procedure TFrmEmployee.BtPesquisarClick(Sender: TObject);
begin
    DMClient.cdsAUX.Close();
    DMClient.cdsAUX.Params[0].AsString := '%' + EdtName.Text + '%';
    DMClient.cdsAUX.Open();
end;

procedure TFrmEmployee.EditEmployee(Sender: TObject);
begin
  // edi��o state-less
    FrmEditEmployee := TFrmEditEmployee.Create(Application);
    try
        DMClient.cdsEMPLOYEE.Params[0].AsInteger := DMClient.cdsAUX.Fields[0].AsInteger;
        DMClient.cdsEMPLOYEE.Open();
        DMClient.cdsAUX.Close();
        FrmEditEmployee.ShowModal();
    finally
        FrmEditEmployee.Release();
    end;
end;

end.

