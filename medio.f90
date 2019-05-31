program p_medio				!el programa busca el valor que hace cero a la funcion (el cero de la f)
implicit none

real::a, b				!no poner como parametro
real::e=0.000001			
real::xm, fa, fxm			!Primero lo que ingresa, luego el resultado
real::zero, error

print*, 'Ingrese el intervalo' 
print*, 'a=' 
read*, a
print*, 'b='
read*, b


do while ((b-a).ge.e)			!do while, mientras la condicion se cumple
  xm=0.5*(a+b)
  fa=cos(a)
  fxm=cos(xm)
    
    if ((fa*fxm).lt.0) then
      b=xm
    
     else
      a=xm

    end if

enddo

zero=0.5*(a+b)				!cuando se cumple, con los valores almacenados obtengo el resultado
error=(b-a)*0.5

print*, 'Su cero es: ', zero, 'con un error de: +/-', error
print*, 'La funcion evaluada en el cero obtenido es: ', cos(zero)


end program
