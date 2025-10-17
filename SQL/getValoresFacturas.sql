create or alter function dbo.getValoresFacturas(@fecha datetime) returns @valores table
(	ClienteID int, SubTotal float, Impuesto float, Total float)
as
	begin
		declare @factura table (FacturaID int, ClienteID int)
		declare @fDetalle table (FacturaID int, Cantidad int, Precio float, ISV float)

		insert into @factura
		select FacturaID, ClienteID from Factura where Fecha = @fecha

		insert into @fDetalle
		select FacturaID, Cantidad, Precio, ISV
		from FacturaDetalle
		where FacturaID in(select FacturaID from @factura)

		insert into @valores
		select f.ClienteID, sum(fd.cantidad * fd.precio), sum(cantidad * precio * isv), sum(cantidad * precio * (1 + isv))
		from @factura f 
		inner join @fDetalle fd on f.facturaid = fd.facturaid
		group by f.ClienteID

		return 
	end
go

select * 
from Cliente as c
inner join dbo.getValoresFacturas('2016-01-02') v on c.ClienteID = v.ClienteID
