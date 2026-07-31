library(ggplot2)
library(dplyr)
library(tidyr)

# Crear una onda cuadrada como suma de armónicos impares
t <- seq(0, 2*pi, length.out = 1000)
f0 <- 1  # Frecuencia fundamental

# Onda cuadrada: suma de senos de armónicos impares con amplitud 1/n
onda_cuadrada <- sin(t * f0)
for(n in seq(3, 15, by = 2)) {
  onda_cuadrada <- onda_cuadrada + (1/n) * sin(t * f0 * n)
}
onda_cuadrada <- onda_cuadrada * (4/pi)  # Normalizar

# Datos para graficar
datos_onda <- data.frame(
  tiempo = t,
  amplitud = onda_cuadrada,
  tipo = "Onda resultante\n(suma de armónicos impares)"
)

# Armónicos individuales
armonicos <- data.frame(
  tiempo = rep(t, 4),
  armonico = rep(c("Fundamental (1f)", "3er armónico (3f)", "5to armónico (5f)", "7mo armónico (7f)"), each = 1000),
  amplitud = c(
    (4/pi) * sin(t * f0),
    (4/pi) * (1/3) * sin(t * f0 * 3),
    (4/pi) * (1/5) * sin(t * f0 * 5),
    (4/pi) * (1/7) * sin(t * f0 * 7)
  ),
  tipo = "Armónicos individuales"
)

# Combinar datos
todos_datos <- bind_rows(datos_onda, armonicos)

# Paleta de colores
colores <- c(
  "Fundamental (1f)" = "#1A5276",
  "3er armónico (3f)" = "#922B21", 
  "5to armónico (5f)" = "#D4AC0D",
  "7mo armónico (7f)" = "#6C3483"
)

# Gráfico de armónicos individuales
p1 <- ggplot(armonicos, aes(x = tiempo, y = amplitud, color = armonico)) +
  geom_line(linewidth = 0.8) +
  scale_color_manual(values = colores) +
  facet_wrap(~armonico, ncol = 2, scales = "free_y") +
  labs(title = "Armónicos individuales de una onda cuadrada",
       subtitle = "Cada armónico es una onda sinusoidal pura — Fourier, 1822",
       x = "Tiempo", y = "Amplitud") +
  theme_minimal(base_size = 12) +
  theme(legend.position = "none",
        strip.text = element_text(face = "bold", size = 10),
        plot.title = element_text(face = "bold", size = 16),
        plot.subtitle = element_text(color = "gray40"))

# Gráfico de la onda resultante
p2 <- ggplot(datos_onda, aes(x = tiempo, y = amplitud)) +
  geom_line(color = "#1A5276", linewidth = 1.2) +
  labs(title = "Onda cuadrada: suma de armónicos impares",
       subtitle = expression(frac(4, pi) * (sin(x) + frac(1, 3) * sin(3*x) + frac(1, 5) * sin(5*x) + ...)),
       x = "Tiempo", y = "Amplitud") +
  theme_minimal(base_size = 12) +
  theme(plot.title = element_text(face = "bold", size = 16),
        plot.subtitle = element_text(color = "gray40"))

# Mostrar ambos gráficos
library(patchwork)
p2 / p1 +
  plot_annotation(
    title = "Descomposición de Fourier: la base matemática del timbre",
    subtitle = "Joseph Fourier demostró que cualquier onda periódica puede descomponerse en una suma de ondas sinusoidales",
    theme = theme(plot.title = element_text(face = "bold", size = 18, hjust = 0.5),
                  plot.subtitle = element_text(color = "gray40", size = 12, hjust = 0.5))
  )
