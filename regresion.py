import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import plotly.express as px

# Cargar datos
datos = pd.read_csv("../data/pacientes.csv")

# Variables para regresión
X = datos["edad"].values
y = datos["presion_sistolica"].values

# Regresión lineal simple
A = np.vstack([X, np.ones(len(X))]).T
m, c = np.linalg.lstsq(A, y, rcond=None)[0]

print(f"Regresión lineal: pendiente = {m:.2f}, intercepto = {c:.2f}")

# Predicciones lineales
y_pred_lineal = m * X + c

# Regresión polinomial grado 2
coef = np.polyfit(X, y, 2)
p = np.poly1d(coef)

print(f"Regresión polinomial grado 2 coeficientes: {coef}")

# Predicciones polinomiales
y_pred_poli = p(X)

# Gráfico con matplotlib
plt.scatter(X, y, color='blue', label='Datos')
plt.plot(X, y_pred_lineal, color='red', label='Regresión lineal')
plt.plot(X, y_pred_poli, color='green', label='Regresión polinomial')
plt.xlabel('Edad')
plt.ylabel('Presión Sistólica')
plt.title('Regresión lineal y polinomial')
plt.legend()
plt.savefig("../results/regresion_matplotlib.png")
plt.close()

# Gráfico interactivo con plotly
fig = px.scatter(x=X, y=y, labels={'x':'Edad', 'y':'Presión Sistólica'}, title='Regresión con Plotly')
fig.add_scatter(x=X, y=y_pred_lineal, mode='lines', name='Lineal')
fig.add_scatter(x=X, y=y_pred_poli, mode='lines', name='Polinomial')
fig.write_html("../results/regresion_plotly.html")
