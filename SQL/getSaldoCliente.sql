create or alter function dbo.getSaldoCliente(@clienteid int) returns float
as
	begin
		declare @valor float
		declare @factura table (FacturaID int, ClienteID int)
		declare @fDetalle table (FacturaID int, Cantidad int, Precio float, ISV float)

		insert into @factura
		select FacturaID, ClienteID from Factura where ClienteID = @clienteid

		insert into @fDetalle
		select FacturaID, Cantidad, Precio, ISV
		from FacturaDetalle
		where FacturaID in(select FacturaID from @factura)

		select @valor = sum(fd.cantidad * fd.Precio * (1 + fd.isv))
		from @fDetalle fd
		inner join @factura f on fd.FacturaID = f.FacturaID

		return @valor
	end
go

select dbo.getSaldoCliente(34)

-- select * from carrera