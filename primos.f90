program primitos

implicit none

integer, parameter::N=5
integer::j, i
integer::x, r, suma

suma=0

do i=1, N
x=0

 	do j=1, N
  		r=mod(i,j)
  		if (r .eq. 0) then
    			x=x+1 
  		endif
 	enddo

if(x .eq. 2) then

	print*, i

	suma=suma+i

endif
enddo

print*, suma

end program
