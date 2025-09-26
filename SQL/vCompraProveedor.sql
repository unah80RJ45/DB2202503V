create or alter view vCompraProveedor
as
	select c.*, p.Nombre as NombreProveedor, tp.Nombre NombreTipo
	from DemoDB.dbo.compra as c
	inner join DemoDB.dbo.Proveedor as p on c.ProveedorID = p.ProveedorID
	inner join DemoDB.dbo.TipoProveedor as tp on p.TipoProveedorID = tp.TipoProveedorID
go

select * from vCompraProveedor

select *
from (
		select c.*, p.Nombre as NombreProveedor, tp.Nombre NombreTipo
		from DemoDB.dbo.compra as c
		inner join DemoDB.dbo.Proveedor as p on c.ProveedorID = p.ProveedorID
		inner join DemoDB.dbo.TipoProveedor as tp on p.TipoProveedorID = tp.TipoProveedorID
	 ) a