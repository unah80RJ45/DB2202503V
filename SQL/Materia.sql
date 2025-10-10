create table Materia 
(
	MateriaID		int not null,
	Nombre			varchar(50) not null,
	UV				int not null,
	Laboratorio		bit not null
)

create or alter procedure spSelectMateria
as
	select * from Materia 
go

create or alter procedure spInsertMateria @mat int output, @nom varchar(50), @Unidades int, @lab bit
as
	select @mat = max(materiaid) + 1 from Materia
	insert into Materia values(@mat, @nom, @Unidades, @lab)
go

create or alter procedure spUpdateMateria @nombre varchar(50), @uv int, @laboratorio bit, @materiaid int
as
	update Materia
	   set Nombre = @nombre, UV = @uv, Laboratorio = @laboratorio
	 where MateriaID = @materiaid
go

create or alter procedure spDeleteMateria @materiaid int
as
	delete from Materia where MateriaID = @materiaid
go

exec sp_tables
