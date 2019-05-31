!Se va a usar el algortimo de Neville (la subrutina esta dentro del main porque es pequeña)

program interpolacion
implicit none
real, allocatable, dimension(:)::x, y
real, allocatable, dimension(:)::Li
integer:: Ntot, Nnod
real::dx
real::xint, yint
integer::i,j
character(len=50)::input
character(len=50)::output


print*, 'Ingrese el nombre del archivo que desee analizar (archivo.dat)'
read*, input

print*, 'Ingrese el numero de nodos (Nnod)'
read*, Nnod

print*, 'Ingrese el numero total de interpolaciones (Ntot=Nnod*10)'
read*, Ntot

print*, 'Ingrese el nombre del archivo de salida (nombre.dat)'
read*, output

allocate(x(0:Nnod), y(0:Nnod))
allocate(Li(0:Nnod))

open(unit=10, file=input, status='unknown')


 do i=0,Nnod
  read(10,*) x(i), y(i)
 enddo

 close(10)

!!!!!! creo un nuevo vector x(0:124)
!x=0.0
!do i=0, Nnod
!  x(i)=i
!enddo


!Ntot ingresa el usuario: es el numero de punto que queremos de nodo a nodo


dx=(x(Nnod)-x(0))/Ntot				!espacio entre punto a punto


open(unit=11, file=output, status='unknown')
 
 !inicio la sumatoria
 do i=0,Ntot
  xint=x(0)+(i*dx)				!son los puntos nuevos
 
!!!!!!!!!!!!!imprimo el input, Nnod, x(0), xint
!print*, 'Nnod, x(0), xint', Nnod, x(0), xint			!(primera prueba)



 call calc_li(Nnod,x,xint,Li)                    !Nnod, grilla (abscisa), nueva grilla, Li es la parte fraccionaria
 
  !creo el productorio
 
   yint=0.0
   do j=0,Nnod
    yint=yint+(Li(j)*y(j))
   enddo

  write(11,*) xint, yint

 enddo						!cierro la sumatoia
 
 close(11)

deallocate(x)
deallocate(y)
deallocate(Li)

contains
 
 subroutine calc_li(nodos, abscisa, grilla, fraccion)
 implicit none

 integer::nodos
 real, dimension(0:nodos)::abscisa
 real::grilla
 real, dimension(0:nodos)::fraccion
 integer::i, j
 real::num, den


!!!!!!!!!!!!!!!!!!!!imprimo input nodos, abscisa(0), grilla

!print*, 'nodos, abscisa(3), grilla', nodos, abscisa(0), grilla    !(primera prueba)

 do i=0,nodos
  num=1.0
  den=1.0
  
   do j=0, nodos
     if(j .ne. i) then


!!!!!!!!!!segunda prueba!!!!!!!!!! esj=i?

!print*, 'esj=i?', i, j


     num=num*(grilla-abscisa(j))
     den=den*(abscisa(i)-abscisa(j))

!!!!!!!es num=0?
!     if (den .ne. 0) then
!     print*, 'denominador', den
!     end if   

     endif
   enddo

   fraccion(i)=num/den

 enddo

end subroutine calc_li


end program
