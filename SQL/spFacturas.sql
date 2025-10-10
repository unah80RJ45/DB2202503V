create or alter procedure spFacturas @ciudad varchar(50)
as
	select f.FacturaID, f.ClienteID, c.Nombre, c.Direccion, f.Fecha
	from Factura f
	inner join Cliente as c on f.ClienteID = c.ClienteID
	where c.Direccion = @ciudad
go

exec spFacturas 'tela'