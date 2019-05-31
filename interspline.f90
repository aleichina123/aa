module interpolacion

contains

subroutine spline(x,y,n,yp1,ypn,y2)
implicit none

integer::n
integer, parameter::nmax=500
real::yp1, ypn
real, dimension(1:n)::x, y, y2
integer::i, k
real::p, qn, sig, un
real, dimension(1:nmax)::u

if(yp1 .gt. 1.e8) then
  y2(1)=0.
  u(1)=0.

 else
  y2(1)=-0.5
  u(1)=(3./(x(2)-x(1)))*((y(2)-y(1))/(x(2)-x(1))-yp1)

endif

do i=2, n-1
   sig=(x(i)-x(i-1))/(x(i+1)-x(i-1))
   p=sig*y2(i-1)+2.
   y2(i)=(sig-1.)/p
   u(i)=(6.*((y(i+1)-y(i))/(x(i+1)-x(i))-(y(i)-y(i-1))/(x(i)-x(i-1)))/(x(i+1)-x(i-1))-sig*u(i-1))/p
enddo

if(ypn .gt. 1.e8) then
  qn=0.
  un=0.
 
 else
  qn=0.5
  un=(3./(x(n)-x(n-1)))*(ypn-(y(n)-y(n-1))/(x(n)-x(n-1)))
endif

y2(n)=(un-qn*u(n-1))/(qn*y2(n-1)+1.)

do k=n-1, 1, -1
   y2(k)=y2(k)*y2(k+1)+u(k)
enddo

end subroutine spline


subroutine splint(xa,ya,y2a,n,x,y)
implicit none

integer::n
real::x, y
real, dimension(1:n)::xa, y2a, ya
integer::k, khi, klo
real::a, b, h

klo=1
khi=n

do while((khi-klo) .gt. 1)
     k=(khi+klo)/2
      
     if (xa(k) .gt. x)then
       khi=k
      else
       klo=k
     endif

enddo

h=xa(khi)-xa(klo)

if (h.eq.0.) then
  stop 'bad xa input in splint'
endif

a=(xa(khi)-x)/h
b=(x-xa(klo))/h
y=a*ya(klo)+b*ya(khi)+((a**3-a)*y2a(klo)+(b**3-b)*y2a(khi))*(h**2)/6

end subroutine splint


end module interpolacion


