close, /all
np=5
n=11

ni=41
nn=101


x = dblarr(np)				
f = dblarr(np)

x2 = dblarr(n)				
f2 = dblarr(n)

x3 = dblarr(n)				
f3 = dblarr(n)

xp4 = dblarr(n)				
f4 = dblarr(n)

x5 = dblarr(ni)				
f5 = dblarr(ni)

x6 = dblarr(nn)				
f6 = dblarr(nn)

x7 = dblarr(nn)				
f7 = dblarr(nn)

xp8 = dblarr(nn)				
f8 = dblarr(nn)

openr,1,'primer_caso.dat'
for i=0, np-1 do begin

 readf, 1, a, b					;read file........ writef
 x(i) = a
 f(i) = b
 ;print, 'Leo la línea', x1(i)

endfor
 close, 1

openr,5,'inter1.dat'
for i=0, ni-1 do begin

 readf, 5, a, b					;read file........ writef
 x5(i) = a
 f5(i) = b

endfor
 close, 5

openr,2,'segundo_caso.dat'
for i=0, n-1 do begin

 readf, 2, a, b					;read file........ writef
 x2(i) = a
 f2(i) = b

endfor
 close, 2

openr,6,'inter2.dat'
for i=0, nn-1 do begin

 readf, 6, a, b					;read file........ writef
 x6(i) = a
 f6(i) = b

endfor
 close, 6


openr,3,'tercer_caso.dat'
for i=0, n-1 do begin

 readf, 3, a, b					;read file........ writef
 x3(i) = a
 f3(i) = b
 
endfor
 close, 3

openr,7,'inter3.dat'
for i=0, nn-1 do begin

 readf, 7, a, b					;read file........ writef
 x7(i) = a
 f7(i) = b

endfor
 close, 7

openr,4,'cuarto_caso.dat'
for i=0, n-1 do begin

 readf, 4, a, b					;read file........ writef
 xp4(i) = a
 f4(i) = b
 
endfor
 close, 4

openr,8,'inter4.dat'
for i=0, nn-1 do begin

 readf, 8, a, b					;read file........ writef
 xp8(i) = a
 f8(i) = b

endfor
 close, 8


device, decomposed=0
loadct, 5

!p.multi=[0,2,2]

plot, x, f, back=255, col=0, $	
 thick=1, title='caso 1', xtitle='x', $
 ytitle='y', chars=1.5, $
 xs=3, ys=1, xr=[-0.1,3.2], yr=[-0.1,1.2], $			;con esto se ajusta a los datos, no es cualquier rango
psym=2

oplot, x5,f5 , col=115, thick=1.5, $
 psym=0


plot, x2, f2, back=255, col=0, $	
 thick=0, title='caso 2', xtitle='x',  $
 ytitle='y', chars=1.5, $
 xs=1, ys=1,  xr=[-1.1,1.1], yr=[0.4,1.1], $				;con esto se ajusta a los datos, no es cualquier rango
psym=2

oplot, x6,f6 , col=115, thick=1.5, $
 psym=0


plot, x3, f3, back=255, col=0, $	
 thick=0, title='caso 3', xtitle='x', $
 ytitle='y', chars=1.5, $
 xs=1, ys=1, xr=[-5.5,5.5], yr=[-0.5,2], $			;con esto se ajusta a los datos, no es cualquier rango
psym=2

oplot, x7,f7, col=115, thick=1.5, $
 psym=0


plot, xp4, f4, back=255, col=0, $	
 thick=0, title='caso 4', xtitle='x', $
 ytitle='y', chars=1.5, $
 xs=1, ys=1, xr=[-5.5,5.5], yr=[0,1.1],	$			;con esto se ajusta a los datos, no es cualquier rango
psym=2

oplot, xp8,f8 , col=115, thick=1.5, $
 psym=0


end

