drop table Sitio 
create table Sitio
(
	SitioID	int not null primary key,
	Nombre	varchar(50) not null
)
go
drop default dftSitio
go
create default dftSitio as 1
go
sp_bindefault dftSitio, 'Sitio.SitioID'
insert into Sitio values(1, 'Sitio 1')
insert into Sitio values(2, 'Sitio 2')
insert into Sitio values(3, 'Sitio 3')


update Alumno set promedio = null

