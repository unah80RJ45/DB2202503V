create or alter view vVentas
as
	select v.FacturaID, v.Fecha, v.ClienteID, c.Nombre, v.SubTotal, v.Impuesto, v.SubTotal + v.Impuesto as Total
	from Venta as v
	inner join Cliente as c on v.ClienteID = c.CLienteID
go

select * from vVentas