select * from proveedor
select * from Compras

update proveedor set limite = 30000
insert into Proveedor values(1, 'Proveedor ABC', 10000, 0), (2, 'Proveedor XYZ', 10000, 0), (3, 'Proveedor FM', 10000, 0)

insert into Compras values(1, '2025-10-01', 1, 10000, 0, 10000)
insert into Compras values(2, '2025-10-01', 1, 9000, 0, 9000)

insert into Compras (CompraID, Fecha, ProveedorID, SubTotal, Impuesto) values(3, '2025-10-02', 1, 2000, 250)

insert into Compras values(4, '2025-10-03', 'Proveedor FM', 3000, 200, 0)
insert into Compras values(5, '2025-10-04', 'Otro Proveedor', 4000, 250, 0)
update Compras set Total = 0
insert into Compras values(6, '2025-10-05', 'Proveedor ABC', 5000, 600, 0)
insert into Compras values(7, '2025-10-10', 'Proveedor XYZ', 3000, 200, 0), (8, '2025-10-10', 'Proveedor FM', 1500, 0, 0)
insert into Compras values(9, '2025-10-10', 'Proveedor KLM', 6000, 400, 0), (10, '2025-10-11', 'Proveedor XYZ', 7500, 500, 0)
insert into Compras values(11, '2025-10-12', 'Proveedor KLM', 1000, 100, 0), (12, '2025-10-12', 'Proveedor XYZ', 1500, 150, 0)
insert into Compras values(13, '2025-10-13', 'Proveedor KLM', 1000, 100, 0), (14, '2025-10-12', 'Proveedor XYZ', 1500, 150, 0)

create or alter trigger trgComprasInsert on Compras for insert
as
	declare @compraid int, @subtotal float, @impuesto float, @proveedor int, @bitacora int
	declare crsCompras cursor for
	select compraid, SubTotal, Impuesto, ProveedorID from inserted

	open crsCompras; fetch next from crsCompras into @compraid, @subtotal, @impuesto, @proveedor

	while @@FETCH_STATUS = 0
		begin
			update Compras set Total = SubTotal + Impuesto
			where CompraID = @compraid
			
			update Proveedor set Saldo = Saldo + @subtotal + @impuesto
			where ProveedorID = @proveedor

			fetch next from crsCompras into @compraid, @subtotal, @impuesto, @proveedor

			insert into Bitacora values('Compra', @compraid, 'I', getdate())
		end

	deallocate crsCompras
go
