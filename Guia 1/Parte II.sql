-- Seleccionado la BD con la que trabajaremos
USE Control_de_libros_CG181933;

-- Consulta a
SELECT A.Codigo, (A.Nombres + ' ' + A.Apellidos) AS Nombre, A.Nacionalidad,
	STUFF( 
		(SELECT ', ' + L.Titulo FROM Libro L
		JOIN Autor_Libro AL ON L.Codigo = AL.Cod_libro
		WHERE AL.Cod_Autor = A.Codigo
		FOR XML PATH ('')), 
	1, 2, '') AS Libros
 FROM Autor A
 ORDER BY Nombre DESC;

-- Consulta b
SELECT DISTINCT (A.Apellidos + ' ' + A.Nombres) AS Autor FROM Autor A
JOIN Autor_Libro AL ON A.Codigo = AL.Cod_Autor
JOIN Libro L ON AL.Cod_libro = L.Codigo
JOIN Editorial E ON L.Cod_editorial = E.Codigo
WHERE E.Nombre = 'Omega';

-- Consulta c
SELECT L.Titulo, COUNT(E.Cod_libro) FROM Libro L
JOIN Ejemplar E ON L.Codigo = E.Cod_libro
GROUP BY L.Titulo, E.Cod_libro

-- Consulta d
SELECT L.Titulo, E.Ubicacion FROM Ejemplar E
JOIN Libro L ON E.Cod_libro = L.Codigo
WHERE E.Estado = 'Prestado';

-- Consulta e
SELECT L.* FROM Libro L
WHERE L.Año_edicion >= 2000 AND L.Año_edicion <= 2007
ORDER BY L.Año_edicion ASC;

-- Consulta f
SELECT E.Ubicacion, COUNT(E.Cod_libro) AS '# Prestados' FROM Ejemplar E
WHERE E.Estado = 'Prestado'
GROUP BY E.Ubicacion, E.Cod_libro;