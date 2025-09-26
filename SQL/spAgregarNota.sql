create or alter procedure spAgregarNota @alumnoid int, @materiaid varchar(20), @valor int
as
	begin transaction
		declare @notas int, @promedio int, @materias int, @error int = 0
		select @materias = isnull(count(*), 0) + 1, @notas = isnull(sum(valor), 0) from Notas where AlumnoID = @alumnoid

		select @promedio = (@notas + @valor) / @materiaid 
		
		update Alumno set Promedio = @promedio where alumnoid = @alumnoid
		if @error = 0 and @@ERROR != 0 select @error = 1

		insert into notas (AlumnoID, MateriaID, Valor) values(@alumnoid, @materiaid, @valor)
		if @error = 0 and @@ERROR != 0 select @error = 1

		insert into Aprobados values(@alumnoid, @materiaid)
		if @error = 0 and @@ERROR != 0 select @error = 1

	if @ERROR = 0
		commit
	else
		rollback
go

select * from alumno
select * from notas
select * from aprobados 

exec spAgregarNota 1, 2, 80

exec sp_help notas

delete from notas 
delete from aprobados
update alumno set Promedio = null 

