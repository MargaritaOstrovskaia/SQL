/* Lesson 025
  Find the printer makers also producing PCs with the lowest RAM capacity and the highest processor speed of all PCs having the lowest RAM capacity. 
  Result set: maker.
*/
select distinct maker
from product
where type = 'Printer' and 
maker in (select maker
from product
where model in (select model
from PC
where ram = (Select min(ram) from pc) and speed = ( select max(speed) as speed
from PC where ram = (Select min(ram) from pc) )))

/* Short database description "Computer firm":

	The database scheme consists of four tables:
	Product(maker, model, type)
	PC(code, model, speed, ram, hd, cd, price)
	Laptop(code, model, speed, ram, hd, screen, price)
	Printer(code, model, color, type, price)

	The Product table contains data on the maker, model number, and type of product ('PC', 'Laptop', or 'Printer').
	It is assumed that model numbers in the Product table are unique for all makers and product types.
	Each personal computer in the PC table is unambiguously identified by a unique code, and is additionally characterized by its model 
	(foreign key referring to the Product table), processor speed (in MHz) – speed field, RAM capacity (in Mb) - ram, 
	hard disk drive capacity (in Gb) – hd, CD-ROM speed (e.g, '4x') - cd, and its price.
	The Laptop table is similar to the PC table, except that instead of the CD-ROM speed, it contains the screen size (in inches) – screen.
	For each printer model in the Printer table, its output type (‘y’ for color and ‘n’ for monochrome) – color field, 
	printing technology ('Laser', 'Jet', or 'Matrix') – type, and price are specified.
*/