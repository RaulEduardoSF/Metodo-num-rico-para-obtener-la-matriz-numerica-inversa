# Metodo numérico para resolver sistema de ecuaciones

En el archivo `Inversa de una matriz - Solución Numérica.pdf` se encuentra una mejor exposición del algoritmo utilizado.

## Algritmo
El algoritmo aprovecha los conocimientos de algebra lineal para emplear el metodo de la matriz adjunta para obtener la matriz inversa y la Regla de Cramer para obtener el valor de los determinantes de las matrices reducidas.
```fortran
Call TSuperior(n,A,b)
DetA = (-1)**b
!Producto de la diagonal
Do i = 1, n
DetA = DetA*A(i,i)
end do
Write(*,*) ’ Det(A) =’,DetA
```
```fortran
!Determinante del menor M(i,j)
if (n.gt.2) then
Call TSuperior(d,M,b)
end if
Det(i,j) = (-1)**b
Do k = 1, n - 1
Det(i,j) = Det(i,j)*M(k,k)
end do
!Elemento (i,j) de la matriz adjunta
Adj(i,j) = (-1)**(i + j)*Det(i,j)
```

Para reducir la matrices algebraicamente y calcular comodamente los determinantes, reducimos todas las matrices reducidas `ij` a una matriz triangular superior.
$$A^{-1} = \frac{(\text{Adj}(A))^{T}}{\left|A\right|}$$

## $$N\times N \text{ dimension}$$
El codigo es capaz de soportar cualquier tamaño de matriz y ademas identifica cuando no existe la matriz inversa.

## Solución numerica a sistema de N ecuaciones
Declarando un vector lineal que contengas las variable dependientes, podemos resolver para las variables independiendientes. La siguiente imagen muestra la solución de un sistema de 9 ecuaciónes lineales y 9 variables independientes.

![image](https://user-images.githubusercontent.com/74220104/208798157-73a29d98-ef31-46ba-a50b-abe5dc0d2427.png)
