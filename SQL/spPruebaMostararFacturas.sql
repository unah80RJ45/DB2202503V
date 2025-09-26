create or alter procedure spPruebaMostararFacturas @ciudad varchar(20)
as
	declare @clientes ListaClientes

	insert into @clientes 
	select ClienteID, Nombre, Direccion from Cliente where Direccion = @ciudad

	exec spMostarFacturasCliente @clientes, 1
go

exec spPruebaMostararFacturas 'progreso'