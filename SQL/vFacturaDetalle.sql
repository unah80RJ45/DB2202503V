create or alter view vFacturaDetalle
as
	select Factura.FacturaID, Factura.ClienteID, Factura.Fecha, 
	sum(facturadetalle.cantidad * facturadetalle.precio) as Valor
	from factura 
	inner join facturadetalle on Factura.FacturaID = FacturaDetalle.FacturaID
	group by Factura.FacturaID, Factura.ClienteID, Factura.Fecha
	having sum(facturadetalle.cantidad * facturadetalle.precio) > 5000
go

select * from vFacturaDetalle
