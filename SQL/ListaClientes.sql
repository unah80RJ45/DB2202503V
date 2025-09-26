drop type ListaClientes
go

create type ListaClientes as table
(
	ClienteID	int,
	Nombre		varchar(50),
	Direccion	varchar(50)
)