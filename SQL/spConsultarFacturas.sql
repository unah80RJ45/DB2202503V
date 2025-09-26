create or alter procedure spConsultarFacturas @cliente int 
as
	select * into #cliente from Cliente where ClienteID = @cliente
	select * into #factura from Factura where ClienteID = @cliente
	select * into #facturadetalle from FacturaDetalle where FacturaID in(select FacturaID from #factura)
	select * into #articulo from articulo where articuloid in(select articuloid from #facturadetalle)
	select * into #marca from Marca where MarcaID in(select MarcaID from #articulo)

	--select *
	--from #factura f 
	--inner join #facturadetalle fd on f.FacturaID = fd.FacturaID
	--inner join #Cliente c on f.ClienteID = c.ClienteID
	--inner join #articulo a on fd.ArticuloID = a.ArticuloID
	--inner join #Marca m on a.MarcaID = m.MarcaID

	--select *
	--from factura f 
	--inner join facturadetalle fd on f.FacturaID = fd.FacturaID
	--inner join Cliente c on f.ClienteID = c.ClienteID
	--inner join articulo a on fd.ArticuloID = a.ArticuloID
	--inner join Marca m on a.MarcaID = m.MarcaID
	--where f.ClienteID = @cliente

	--select count(*)	from #factura, #cliente, #facturadetalle, #articulo, #marca
	select count(*) from Factura
	select count(*) from FacturaDetalle
	select count(*) from Cliente
	select count(*) from articulo 
	select count(*) from marca 

	select * from alumno, carrera 
	where alumno.CarreraID = Carrera.CarreraID
go

exec spConsultarFacturas 34
