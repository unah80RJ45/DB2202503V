select * from proveedor 
select * from Compras
select * from bitacora 

delete from Compras where CompraID = 2

create or alter trigger trgComprasDelete on Compras for delete
as
	declare @compraid int, @proveedor int, @total as float

	select @proveedor = proveedorid, @total = Total, @compraid = CompraID
	from deleted

	update Proveedor set Saldo = Saldo - @total
	where ProveedorID = @proveedor

	insert into Bitacora values('Compra', @compraid, 'D', getdate())
go
