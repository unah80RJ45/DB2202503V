create or alter procedure spVariableTabla
as
	declare @tCliente as table (ClienteID int, Nombre varchar(50))

	insert into @tCliente values(1, 'cliente prueba')

	insert into @tCliente 
	select ClienteID, Nombre from Cliente

	update @tCliente set nombre = LOWER(nombre)
	delete @tCliente where ClienteID  > 10
 
	select * from @tCliente
go

exec spVariableTabla