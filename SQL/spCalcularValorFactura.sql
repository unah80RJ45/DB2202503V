--alter table Factura add Valor float
create or alter procedure spCalcularValorFactura @facturaid int
as
	declare @valor float

	select @valor = sum(cantidad * precio) from FacturaDetalle
	where FacturaID = @facturaid

	update Factura set Valor = @valor where FacturaID = @facturaid
go

exec spCalcularValorFactura 22901
select * from Factura

