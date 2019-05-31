module lu

contains

subroutine lu_fac(matriz) 	!!tomo una matriz cualquiera y la factorizo
 implicit none

!real, intent(inout), dimension(:,:), allocatable::matriz		!la matriz entra y sale

 real, intent(inout)::matriz(:,:)					!notacion antigua
 integer::n, i

 n=size(matriz,1)				!me da la dimension de la matriz (funciona con comparaciones)

!allocate(matriz(2:n, 3))			!luego de tener n desalojo

 do i=2, n
  matriz(i,1)=matriz(i,1)/matriz(i-1,2)
  matriz(i,2)=matriz(i,2)-matriz(i,1)*matriz(i-1,3)
 enddo

end subroutine lu_fac

subroutine lu_solve(matriz, g)			!!g seria el b de Ax=b
 implicit none
 
 real, intent(in)::matriz(:,:)			!esta matriz ya esta diagonalizada
 real, intent(inout)::g(:)
 integer::i, n

 n=size(g,1)					!usamos la dimension de g respecto a 1

 do i=2,n
  g(i)=g(i)-matriz(i,1)*g(i-1)			!g se convierte en x
 enddo

 g(n)=g(n)/matriz(n,2)				!punto extremo

 do i=n-1, 1, -1				!al duplicar el ultimo coincide con el primer en pasos de -1
  g(i)=(g(i)-matriz(i,3)*g(i+1))/matriz(i,2)	!tengo x y lo vuelvo a reemplazar
 enddo

end subroutine lu_solve

end module lu
