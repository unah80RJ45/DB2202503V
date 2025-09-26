create or alter procedure spCalcularValorFacturasCliente @cliente int
as
	declare @factura int

	declare crsFacturas cursor for
	select FacturaID from Factura where ClienteID = @cliente

	open crsFacturas; fetch next from crsFacturas into @factura

	while @@FETCH_STATUS = 0
		begin
			exec spCalcularValorFactura @factura; fetch next from crsFacturas into @factura
		end

	deallocate crsFacturas;

	select *
	from Factura 
	where ClienteID = @cliente
go

exec spCalcularValorFacturasCliente 34