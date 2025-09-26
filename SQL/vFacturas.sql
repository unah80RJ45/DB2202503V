create view vFacturas
as
	select f.*, c.Nombre
	from factura f 
	inner join facturadetalle fd on f.FacturaID = fd.FacturaID
	inner join Cliente c on f.ClienteID = c.ClienteID
	inner join articulo a on fd.ArticuloID = a.ArticuloID
	inner join Marca m on a.MarcaID = m.MarcaID
go

select * from vFactuas
