create or alter procedure spMostarFacturasCliente @Clientes as  ListaClientes readonly, @articuloid int
as
	declare @Articulo table (ArticuloID int, Nombre varchar(50))

	insert into @Articulo 
	select articuloid, Nombre
	from Articulo where ArticuloID = @articuloid

	select articuloid, nombre into #articulo from Articulo where ArticuloID = @articuloid

	select * 
	from @clientes 

	select *
	from Factura as f
--	inner join @clientes as c on f.ClienteID = c.clienteid
	where ClienteID in(select ClienteID from @clientes)
go

--exec spMostarFacturasCliente 34, 40, 0
-- drop procedure spMostarFacturasCliente