create view vCodigoNombre
as
	select alumnoid, Nombre from alumno
	union
	select carreraid, nombre from carrera
go

create view vCarreraSinAlumno 
as
	select *
	from Carrera 
	where CarreraID not in(select CarreraID from Alumno)
go

select * from vCarreraSinAlumno

create view vAlumnoInsert
as
	insert into Alumno values(7, '7777', 1, 0, 'SPS')
go

update vAlumnoCarrera set Nombre = 'Juan Perez' where nombre = 'Juan'

select * from vAlumnoCarrera



