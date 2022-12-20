# Metodo numérico para obtener la matriz inversa

En el archivo `Inversa de una matriz - Solución Numérica.pdf` se encuentra una mejor exposición del algoritmo utilizado.

## Algritmo
El algoritmo aprovecha los conocimientos de algebra lineal para emplear el metodo de la matriz adjunta para obtener la matriz inversa y la Regla de Cramer para obtener el valor de los determinantes de las matrices reducidas.
Para reducir la matrices algebraicamente y calcular comodamente los determinantes, reducimos todas las matrices reducidas `ij` a una matriz triangular superior.
$$A^{-1} = \frac{(\text{Adj}(A))^{T}}{\left|A\right|}$$

## $$N\times N \text{ dimension}$$
El codigo es capaz de soportar cualquier tamaño de matriz y ademas identifica cuando no existe la matriz inversa.
