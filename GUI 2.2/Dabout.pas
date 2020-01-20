unit Dabout;

{-------------------------------------------------------------------}
{                    Unit:    Dabout.pas                            }
{                    Project: EPANET2W                              }
{                    Version: 2.0                                   }
{                    Date:    5/31/00                               }
{                             9/7/00                                }
{                             12/29/00                              }
{                             1/5/01                                }
{                             3/1/01                                }
{                             11/19/01                              }
{                             12/8/01                               }
{                             6/24/02                               }
{                             11/14/07                              }
{                    Author:  L. Rossman                            }
{                                                                   }
{   Form unit containing the "About" dialog box for EPANET2W.       }
{-------------------------------------------------------------------}

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TAboutBoxForm = class(TForm)
    Panel1: TPanel;
    ProductName: TLabel;
    Version: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Build: TLabel;
    Panel2: TPanel;
    ProgramIcon: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel3: TPanel;
    Label6: TLabel;
    Label9: TLabel;
    laDate: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    laVersion: TLabel;
    Panel6: TPanel;
    GroupBox2: TGroupBox;
    Memo2: TMemo;
    Label11: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBoxForm: TAboutBoxForm;


implementation

{$R *.DFM}

end.

