program uso_spline

use interpolacion

implicit none

real, allocatable, dimension(:)::xa, ya, y2
real::dx, xint, yint
real::yp1, ypn
integer:: Ntot, Nnod
integer::i
character(len=50)::input
character(len=50)::output

print*, 'Ingrese el nombre del archivo que desee analizar (archivo.dat)'
read*, input

print*, 'Ingrese el nombre del archivo de salida (nombre.dat)'
read*, output

print*, 'Ingrese el numero de nodos (Nnod)'
read*, Nnod

print*, 'Ingrese el numero total de interpolaciones (Ntot=Nnod*10)'
read*, Ntot

allocate(xa(1:Nnod), ya(1:Nnod), y2(1:Nnod))


open(unit=10, file=input, status='unknown')

 do i=1,Nnod
  read(10,*) xa(i), ya(i)

  print*, xa(i), ya(i)

 enddo
 close(10)

yp1=0.
ypn=0.

call spline(xa,ya,Nnod,yp1,ypn,y2)
dx=(xa(Nnod)-xa(1))/float(Ntot)
open(unit=11, file=output, status='unknown')
	
 do i=1, Ntot

  xint=xa(1)+(i*dx)  


  call splint(xa,ya,y2,Nnod,xint,yint)

  write(11,*) xint, yint 

 enddo
 close(11)
				

end program

