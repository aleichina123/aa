program tab
implicit none

!integer, parameter::N=4          !1)
!integer, parameter::N=10	  !2)
integer, parameter::N=10	  !2)
real, dimension(0:N)::x, xp
real, dimension(0:N)::f
real::pi,dx
integer::i

pi=acos(-1.)


!!!Primer caso!!
!x=(/ 0.0, pi/6.0, pi/2.0, 5.*pi/6.0, pi /)		!!!!declaro un vector de elementos discretos
!f=sin(x)

!!Segundo caso!!
!dx=2./N
!do i=0, N
!  x(i) = -1.+(i*dx)
!enddo
!f=1./(1.+x*x)

!!Tercer caso!!
!dx=10./N
!do i=0, N
!  x(i) = -5.+(i*dx)
!enddo
!f=1./(1.+x*x)

!!Cuarto caso!!
dx=2./N
do i=0, N
  x(i) = -1.+(i*dx)
enddo
xp=5.*sin(0.5*pi*x)
f=1./(1.+xp*xp)


!open(unit=12, file='primer caso.dat', status='unknown')
!do i=0, 4
! write(12,*) x(i), f(i)
!enddo
! close(12)


!open(unit=13, file='segundo caso.dat', status='unknown')
!do i=0,10
!  write(13,*) x(i), f(i)
!enddo
! close(13)

!open(unit=14, file='tercer_caso.dat', status='unknown')
!do i=0, 10
!  write(14,*) x(i), f(i)
!enddo
! close(14)

open(unit=15, file='cuarto_caso.dat', status='unknown')
do i=0,10
  write(15,*) xp(i), f(i)
enddo
 close(15)

end program
