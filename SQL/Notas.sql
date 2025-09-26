create table Notas
(
	AlumnoID	int not null,
	MateriaID	varchar(10) not null,
	Valor		int,

	constraint pkNotas primary key (AlumnoID, MateriaID)
)

create table Aprobados
(
	AlumnoID	int,
	MateriaID	int 
)
