create or alter procedure spInsertarVentas @cliente varchar(50), @fecha datetime, @SubTotal float, @Impuesto float
as
	declare @facturaid int, @noCliente int

	select @facturaid = isnull(max(FacturaID), 0) + 1 from Factura

	exec spInsertarCliente @Cliente, @noCliente output

	insert into Venta values (@facturaid, @fecha, @noCliente, @SubTotal, @Impuesto)

	select * from vVentas 
go

exec spInsertarVentas 'Cliente ABC', '2025-09-19', 4000, 250

select * from cliente 

