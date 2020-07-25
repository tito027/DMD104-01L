-- Creando vista (Se hace de manera separada para que no de error)
create view copia_libro as
select top 100 percent 
	cp.isbn as ISBN, 
	copy_no as 'Copia', 
	case 
		when on_loan = 'Y'  
			then 'Si' 
		when on_loan = 'N' 
			then 'No' 
		else 'No' 
		end 
	as 'Prestado', 
	title as 'Título', 
	translation as 'Traducción', 
	cover as 'Forro' 
	from library.dbo.copy cp 
	inner join 
	library.dbo.title tt 
		on cp.title_no = tt.title_no 
	inner join 
	library.dbo.item it 
		on cp.isbn = it.isbn 
	where cp.isbn = 1 or cp.isbn= 500 or cp.isbn= 1000 
	order by cp.isbn;

