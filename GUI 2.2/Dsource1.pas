unit Dsource;

{-------------------------------------------------------------------}
{                    Unit:    Dsource.pas                           }
{                    Project: EPANET2W                              }
{                    Version: 2.0                                   }
{                    Date:    5/29/00                               }
{                             11/19/01                              }
{                             6/25/07                               }
{                    Author:  L. Rossman                            }
{                                                                   }
{   Form unit with a dialog box that edits water quality source     }
{   options for a node.                                             }
{                                                                   }
{   This unit and its form were totally re-written. - 6/25/07       }
{-------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Uglobals, NumEdit;

type
  TSourceForm = class(TForm)
    NumEdit1: TNumEdit;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BtnOK: TButton;
    BtnCancel: TButton;
    BtnHelp: TButton;
    Label3: TLabel;
    NumEdit2: TNumEdit;
    Label4: TLabel;
    NumEdit3: TNumEdit;
    Label5: TLabel;
    ComboBox1: TComboBox;
    Label6: TLabel;
    Label7: TLabel;
    Bevel1: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure BtnHelpClick(Sender: TObject);
  private
    { Private declarations }
    theNode: TNode;
    theIndex: Integer;
    theItemIndex: Integer;
  public
    { Public declarations }
    Modified: Boolean;
  end;

//var
//  SourceForm: TSourceForm;

implementation

{$R *.DFM}

procedure TSourceForm.FormCreate(Sender: TObject);
//--------------------------------------------------
// OnCreate handler for form.
//--------------------------------------------------
var
  i: Integer;
begin
// Set form's font
  Uglobals.SetFont(self);

// Get pointer to node being edited
  theNode := Node(CurrentList, CurrentItem[CurrentList]);

// Get index of Source Quality property for the node
  case CurrentList of
  JUNCS:   theIndex := JUNC_SRCTYPE_INDEX;
  RESERVS: theIndex := RES_SRCTYPE_INDEX;
  TANKS:   theIndex := TANK_SRCTYPE_INDEX;
  else     theIndex := -1;
  end;

// Load current source quality properties into the form
  if theIndex > 0 then
  begin
    ComboBox1.ItemIndex := 0;
    for i := Low(SourceType) to High(SourceType) do
      if SameText(theNode.Data[theIndex],SourceType[i]) then
      begin
        ComboBox1.ItemIndex := i;
        break;
      end;
    NumEdit1.Text := theNode.Source.Quality;
    Edit1.Text := theNode.Source.Pattern;
    NumEdit2.Text := theNode.Source.Start;
    NumEdit3.Text := theNode.Source.Duration;
  end;
  theItemIndex := ComboBox1.ItemIndex;
  Modified := False;
end;

procedure TSourceForm.BtnOKClick(Sender: TObject);
//----------------------------------------------------
// OnClick handler for OK button.
// Transfers data from form to node being edited.
//----------------------------------------------------
begin
  if theIndex > 0 then
  begin
    if Length(Trim(NumEdit1.Text)) = 0 then
    begin
      theNode.Source.Quality := '';
      theNode.Source.Pattern := '';
      theNode.Source.Start := '';
      theNode.Source.Duration := '';
      theNode.Data[theIndex] := SourceType[ComboBox1.ItemIndex];
    end
    else
    begin
      theNode.Data[theIndex]  := SourceType[ComboBox1.ItemIndex];
      theNode.Source.Quality  := NumEdit1.Text;
      theNode.Source.Pattern  := Edit1.Text;
      theNode.Source.Start    := NumEdit2.Text;
      theNode.Source.Duration := NumEdit3.Text;
    end;
  end;
  if (NumEdit1.Modified)
  or (Edit1.Modified)
  or (NumEdit2.Modified)
  or (NumEdit3.Modified)
  or (ComboBox1.ItemIndex <> theItemIndex)
  then Modified := True;
  ModalResult := mrOK;
end;

procedure TSourceForm.BtnCancelClick(Sender: TObject);
//----------------------------------------------------
// OnClick handler for Cancel button.
//----------------------------------------------------
begin
  ModalResult := mrCancel;
end;

procedure TSourceForm.BtnHelpClick(Sender: TObject);
begin
  Application.HelpContext(245);
end;

end.
