create or alter procedure spConsultarAlumnos @carreraid int
as
	declare @nombre varchar(50)

	declare crsAlumno cursor for 
	select Nombre from ALumno where CarreraID = @carreraid

	open crsAlumno

	fetch next from crsAlumno into @nombre; 

	while @@FETCH_STATUS = 0
		begin
			print @nombre
			fetch next from crsAlumno into @nombre; 			
		end

	deallocate crsAlumno
go

exec spConsultarAlumnos 1

-- select nombre from alumno where carreraid = 1