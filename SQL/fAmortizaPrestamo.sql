create or alter function dbo.fAmortizaPrestamo(@capital float, @tasa float, @tiempo int) returns @amortiza table
( NumPago int, Capital float, Interes float, Abono float, Saldo float)
as
	begin
		declare @i int = 1, @saldo float = @capital

			while @i <= @tiempo
				begin
					insert into @amortiza (NumPago, Capital, Interes, Abono, Saldo)
					values(@i, @saldo, cast(@saldo * @tasa / 12 as numeric(11,2)), @capital / @tiempo, cast(@saldo - @capital / @tiempo as numeric(11,2)) )

					select @i = @i + 1, @saldo = cast(@saldo - @capital / @tiempo as numeric(11,2))
				end
		
		return
	end
go

select *
from dbo.fAmortizaPrestamo(10000, 0.1, 12)