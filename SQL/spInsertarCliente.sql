create or alter procedure spInsertarCliente @nombre varchar(50), @clienteid int output
as
	select @clienteid = max(ClienteID) from Cliente where Nombre = @nombre

	if @clienteid is null
		begin
			select @clienteid = isnull(max(ClienteID), 0) + 1 from Cliente 

			insert into Cliente values(@clienteid, @nombre)
		end
go

--exec spInsertarCliente 'Abarratoria ABC'
--select * from Cliente



select isnull(max(CLienteID), 0) + 1 from cliente
