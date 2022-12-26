unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Maps,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListBox, System.ImageList,
  FMX.ImgList, System.Generics.Collections;

type
  Tfprincipal = class(TForm)
    MapView1: TMapView;
    panel_top: TPanel;
    Panel2: TPanel;
    btinicio: TSpeedButton;
    btllegada: TSpeedButton;
    Lineas: TComboBox;
    ImageList1: TImageList;
    procedure FormShow(Sender: TObject);
    procedure btinicioClick(Sender: TObject);
  private
    { Private declarations }
    procedure agregarMarcadorPartida;
  public
    { Public declarations }

    posicion : TMapCoordinate;
    MarcadorI, MarcadorF : TMapMarkerDescriptor;
    Marcadores : TList<TMapMarker>;


  end;

var
  fprincipal: Tfprincipal;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

procedure Tfprincipal.agregarMarcadorPartida;
var
  s : TSizeF;
  pos: TMapCoordinate;
begin
  s := TSizeF.Create(16, 16);            //Image size
  pos.Latitude := mapview1.Location.Latitude;
  pos.Longitude := mapview1.Location.Longitude;
  MarcadorI.Icon := ImageList1.Source.Items[0].MultiResBitmap.Items[0].Bitmap;
  MarcadorI := TMapMarkerDescriptor.Create(pos , 'Partida');
  MarcadorI.Draggable := True;
  MarcadorI.Visible :=True;
  Marcadores.Add(MapView1.AddMarker(MarcadorI));

end;

procedure Tfprincipal.btinicioClick(Sender: TObject);
begin
 // Agregar el Marcador Inicial
 agregarMarcadorPartida;

end;

procedure Tfprincipal.FormShow(Sender: TObject);
begin
  posicion.Latitude := -17.7817958;
  posicion.Longitude := -63.1716228;
  MapView1.Location := posicion;
  MapView1.Zoom:= 12;

end;

end.
{
var
  lt,lg : string;
  lat, long : double;
  filas, i, v: integer;
  posicion : TMapCoordinate;
  //parada : TMapMarker;
  parada : TMapMarkerDescriptor;
begin

  filas := gridparadas.RowCount;
  for i := 0 to filas do
    begin
        lg := gridparadas.Cells[1,i];
        lt := gridparadas.Cells[2,i];

        lt := StringReplace(lt, ',', '.', [rfReplaceAll, rfIgnoreCase]);
        lg :=StringReplace(lg, ',', '.', [rfReplaceAll, rfIgnoreCase]);

        val(lt,lat,v);
        val(lg,long,v);

        posicion := TMapCoordinate.Create(lat, long);

        parada := TMapMarkerDescriptor.Create(posicion,'Parada');
        parada.Snippet:= 'lg: ' + floattostr(long) + '  lt: '+ floattostr(lat);
        parada.Visible := true;
        MapView1.AddMarker(parada);

    end;
 }