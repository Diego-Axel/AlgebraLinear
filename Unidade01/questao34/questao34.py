import numpy as np
import matplotlib.pyplot as plt
from scipy.linalg import lu

# Dados da matriz aumentada (como no Octave)
a = np.array([
    [1,  0,    0,     0,      0,       0,      0],
    [1,  2,    4,     8,     16,      32,   2.90],
    [1,  4,   16,    64,    256,    1024,  14.80],
    [1,  6,   36,   216,   1296,    7776,  39.60],
    [1,  8,   64,   512,   4096,   32768,  74.30],
    [1, 10,  100,  1000,  10000,  100000, 119.00]
])

# Separando as colunas de t e força para o gráfico
t_values = a[:, 1]
f_values = a[:, 6]

# Plotando os pontos
plt.plot(t_values, f_values, 'o', label='Pontos')

# Separando a matriz dos coeficientes e o vetor independente
A = a[:, 0:6]
b = a[:, 6]

# Resolvendo o sistema usando numpy (equivalente ao rref)
x = np.linalg.solve(A, b)

# Criando o polinômio com os coeficientes
def p(t):
    return x[0] + x[1]*t + x[2]*t**2 + x[3]*t**3 + x[4]*t**4 + x[5]*t**5

# Plotando o polinômio
t_plot = np.linspace(min(t_values), max(t_values), 200)
plt.plot(t_plot, p(t_plot), label='Polinômio Interpolador')

plt.xlabel('t (velocidade)')
plt.ylabel('f (força)')
plt.title('Interpolação Polinomial - Grau 5')
plt.legend()
plt.grid(True)
plt.show()

# Valor estimado para t = 7.5
print("Força estimada para t = 7.5:", p(7.5))