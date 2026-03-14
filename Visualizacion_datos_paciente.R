# Carga de librerías
library(ggplot2)
library(dplyr)

# Carga de datos
datos <- read.csv("../data/pacientes.csv")

# Resumen estadístico
print(summary(datos))

# Distribución de edad y presión sistólica
ggplot(datos, aes(x=edad)) +
  geom_histogram(binwidth=5, fill="skyblue", color="black") +
  theme_minimal() +
  ggtitle("Distribución de Edad")

ggsave("../results/edad_histograma.png")

ggplot(datos, aes(x=presion_sistolica)) +
  geom_histogram(binwidth=5, fill="salmon", color="black") +
  theme_minimal() +
  ggtitle("Distribución de Presión Sistólica")

ggsave("../results/presion_histograma.png")

# Boxplot biomarcador por resultado
ggplot(datos, aes(x=factor(resultado), y=biomarcador)) +
  geom_boxplot(fill="lightgreen") +
  labs(x="Resultado (0=negativo, 1=positivo)", y="Biomarcador") +
  ggtitle("Biomarcador por Resultado") +
  theme_minimal()

ggsave("../results/biomarcador_boxplot.png")
