select * from carrera 

insert into Carrera values(1, 'Sistemas'), (2, 'Mecanica')
insert into Alumno values(1, 'Juan', 1), (2, 'Maria', 1), (3, 'Pedro', 2)
insert into Alumno values(4, 'Miguel', 2)
update Alumno set Nombre = upper(Nombre)
delete from alumno where alumnoid = 2

select * from carrera 
select * from alumno
select * from vAlumnoCarrera
