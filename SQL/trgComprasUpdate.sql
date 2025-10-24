select * from proveedor 
select * from Compras 

create or alter trigger trgComprasUpdateMismoProveedor on Compras for update
as
	declare @proveedorid int = 0, @cambio float, @compraid int

	select @compraid = i.CompraID, @proveedorid = i.ProveedorID, @cambio = i.Total - d.Total
	from inserted as i
	inner join deleted d on i.CompraID = d.CompraID and i.ProveedorID = d.ProveedorID 

	update Proveedor set Saldo = Saldo + @cambio
	where ProveedorID = @proveedorid
go

create or alter trigger trgComprasUdpdateProveedorDif on Compras for update
as
		declare @iProveedor int = 0, @dProveedor int, @iTotal float, @dTotal float

		select @iProveedor = ProveedorID, @iTotal = Total from inserted
		select @dProveedor = ProveedorID, @dTotal = Total from deleted

		update proveedor set Saldo = Saldo - @dTotal where ProveedorID = @dProveedor
		update proveedor set Saldo = Saldo + @iTotal where ProveedorID = @iProveedor
go

update compras set  ProveedorID = 2 where CompraID = 2
