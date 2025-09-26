create table Carrera
(
	CarreraID	int not null,
	Nombre		varchar(50) not null
)

create table Alumno 
(
	AlumnoID	int not null,
	Nombre		varchar(50) not null,
	CarreraID	int not null
)
alter table Alumno add Promedio float
alter table Alumno add Direccion varchar(50)

alter view vAlumnoCarrera
as
	select a.AlumnoID, a.Nombre, a.CarreraID, a.Promedio, c.Nombre NombreCarrera
	from Alumno as a
	inner join Carrera c on a.CarreraID = c.CarreraID
go

create or alter view vAlumnosPorCarrera
as
	select NombreCarrera, count(*) as Alumnos
	from vAlumnoCarrera
	group by NombreCarrera
go

select * from vAlumnoCarrera
select * from vAlumnosPorCarrera

insert into alumno values(5, 'Carlos', 1, 80, 'SPS')
