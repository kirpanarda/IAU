CREATE TABLE TblMusteriler(
MusteriID int primary key identity,
MusteriAd varchar (50),
MusteriSoyad varchar (50),
MusteriAdres varchar (200),
MusteriIletisimBilgi varchar(11)
)
CREATE TABLE TblPersonel(
PersonelID int primary key identity,
PersonelAd varchar (50),
PersonelSoyad varchar (50),
PersonelAdres varchar (200),
PersonelIletisimBilgi varchar(11)
)
CREATE TABLE tblmenu (
MenuId int primary key identity,
MenuAd varchar (50),
)
CREATE TABLE TblYemekBilgi(
YemekId int primary key identity,
YemekAd varchar (50),
YemekFiyat decimal(4,2)
)
CREATE TABLE TblStokTakip(
StokId int primary key identity,
StokAdet varchar (50)
)
CREATE TABLE TblTedarik (
TedarikciId int primary key identity,
TedarikciFirmaAd varchar (50),
TedarikciFirmaAdres varchar (200)
)
CREATE TABLE TblRezervasyon (
RezervasyonId int primary key identity,
RezervasyonNo varchar (100),
RezervasyonMasaNo varchar (100),
RezervasyonTarih datetime,
RezervasyonKisiSayi varchar(50),
RezervasyonPersonelIdFk int foreign key references TblPersonel(PersonelID),
RezervasyonMusteriIdFk int foreign key references TblMusteriler(MusteriID),
MenuIdFk int foreign key references TblMenu(MenuId)
)
CREATE TABLE TblMalzeme
(
MalzemeId int primary key identity,
MalzemeAd varchar(100),
StokAdetFk int foreign key references TblStokTakip(StokId)
) 
CREATE TABLE TblYemekMalzeme
(
YemekMalzemeId int primary key identity,
YemekAdlariIdFk int foreign key references TblYemekBilgi(YemekId),
MalzemeIdFk int foreign key references TblMalzeme(MalzemeId)
) 
CREATE TABLE TblMenuYemek
( 
MenuYemekId int primary key identity,
MenuIdFk int foreign key references tblmenu(MenuId),
YemekIdFk int foreign key references TblYemekBilgi(YemekId)
)
CREATE TABLE TblStokTedarik
(
StokTedarikId int primary key identity,
TedarikciIdFk int foreign key references TblTedarik(TedarikciId),
StokIdFk int foreign key references TblStokTakip(StokId)
)