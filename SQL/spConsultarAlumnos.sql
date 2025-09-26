alter procedure spConsultarAlumnos
as
	select a.AlumnoID, a.Nombre, a.CarreraID, c.Nombre, upper(a.Nombre) as NombreMayuscula 
	from Alumno a 
	inner join Carrera c on a.CarreraID = c.CarreraID
	order by a.Nombre
go

execute spConsultarAlumnos
