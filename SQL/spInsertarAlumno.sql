create or alter procedure spInsertarAlumno @nombre varchar(50), @carrera varchar(50), @direccion varchar(50) = 'SPS'
as
	declare @carreraid int, @alumnoid int
	select @carreraid = max(CarreraID) from Carrera where Nombre = @carrera
	if @carreraid is null
		begin
			select @carreraid = max(CarreraID) + 1 from Carrera
			insert into Carrera values(@carreraid, @carrera)
			select * from Carrera where CarreraID = @carreraid
		end
	select @alumnoid = max(AlumnoID) + 1 from vAlumnoCarrera
	insert into Alumno (AlumnoID, Nombre, CarreraID, Direccion) values(@alumnoid, @nombre, @carreraid, @direccion)
	select * from Alumno where AlumnoID = @alumnoid
go



