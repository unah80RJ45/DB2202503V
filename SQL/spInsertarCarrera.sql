alter procedure spInsertarCarrera @nombre varchar(50)
as
	declare @carreraid int

	select @carreraid = max(CarreraID) + 1 from Carrera

	insert into Carrera values(@carreraid, @nombre)

	select * from Carrera where CarreraID = @carreraid
go

exec spInsertarCarrera 'Mercadotecnia'

select * from Carrera
