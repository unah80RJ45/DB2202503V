create or alter function dbo.fImpresoras() returns @printers table (Usuario varchar(50), Impresora varchar(200))
as
	begin
		insert into @printers values('juan.perez', '192.160.0.200\Epson')
		insert into @printers values('jose.lopez', '192.160.0.201\Cannon')

		return
	end
go

select * from dbo.fImpresoras()

insert into f