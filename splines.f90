program splin

use lu
 implicit none

 allocate(xn(0:Nnod), yn(0:Nnod))
 allocate(h(0:Nnod), d(Nnod-1))		!h es el dx
 allocate(matlu(Nnod-1,3))		!!Nnod filas y 3 columnas

 open(unit=1, file='', status='unknown')
 do j=0, Nnod
  read(1,*) xn(j), yn(j)
 enddo
 close(1)

 do j=1, Nnod
  h(j)=xn(j)-xn(j-1)
 enddo

 

end program
