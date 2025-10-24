drop table Proveedor 
drop table Compras
drop table Bitacora 

create table Proveedor
(
	ProveedorID	int not null,
	Nombre		varchar(50) not null,
	Limite		float not null,
	Saldo		float not null,
	constraint	pkProveedor primary key (ProveedorID)
)
alter table Proveedor add constraint chkProveedorSaldoLimite check (Saldo <= Limite) 

create table Compras
(
	CompraID	int not null,
	Fecha		datetime not null,
	ProveedorID	int not null,
	SubTotal	float not null,
	Impuesto	float not null,
	Total		float not null,

	constraint pkCompras primary key (CompraID),
	constraint fkComprasProveedor foreign key (ProveedorID) references Proveedor
)

drop table Bitacora 

create table Bitacora
(
	BitaCoraID	int identity(1, 1),
	Tabla		varchar(20) not null,
	Registro	int not null,
	AccionID	varchar not null,
	Fecha		datetime not null
)

create default dftCero as 0

exec sp_bindefault 'dftCero', 'Compras.Total'

