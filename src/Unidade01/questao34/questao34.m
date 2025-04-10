clc
clear

a = [1  0   0    0     0      0     0       // Aqui criamos a matriz aumentada do sistema. Cada linha representa uma equação do polinômio.
     1  2   4    8     16     32    2.90
     1  4  16   64    256   1024   14.8
     1  6  36  216   1296   7776   39.6
     1  8  64  512   4096  32768   74.3
     1 10 100 1000  10000 100000  119];

plot(a(:,2), a(:,7), 'o') // Plota os pontos experimentais no gráfico:
hold on // Diz ao Octave para manter os pontos no gráfico, mesmo depois de adicionar mais curvas (ex: o polinômio).

s = rref(a); // Aplica o método da redução de Gauss (forma escalonada reduzida) para resolver o sistema. Isso encontra os coeficientes do polinômio.

x = s(:,7) // Pega a última coluna da matriz escalonada s que contém os valores dos coeficientes a0 a1 a2..., a5.

p = @(t) x(1) + x(2)*t + x(3)*t^2 + x(4)*t^3 + x(5)*t^4 + x(6)*t^5 // Cria a função polinomial p(t) com os coeficientes que acabamos de calcular.

fplot(p) // Plota a curva do polinômio no mesmo gráfico dos pontos experimentais.



