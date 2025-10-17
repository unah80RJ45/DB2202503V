create or alter function fFormatoFecha (@fecha as datetime) returns varchar(50)
as
	begin
		declare @retorno as varchar(50)
		declare @dia int, @ano int, @mes int, @nombre varchar(20)

		select @dia = day(@fecha), @mes = month(@fecha), @ano = year(@fecha)

		select @nombre = case @mes
								when 1 then 'Enero' when 2 then 'Febrero' when 3 then 'Marzo' when 4 then 'Abril'
								when 5 then 'Mayo' when 6 then 'Junio' when 7 then 'Julio' when 8 then 'Agosto'
								when 9 then 'Septiembre' when 10 then 'Octubre' when 11 then 'Noviembre' else 'Diciembre'
						end

		select @retorno = concat(@dia, ' de ', @nombre, ' de ', @ano)

		return @retorno
	end
go

print dbo.fFormatoFecha(getdate())
