
library(ggplot2)
library(dplyr)

set.seed(1962)  # Año del Poème Symphonique

# Simular 100 metrónomos con tempos aleatorios
n_metronomos <- 100
tempos <- runif(n_metronomos, 40, 208)  # Tempos entre 40 y 208 BPM
duraciones <- 1 / (tempos / 60)  # Duración de cada tick en segundos

# Simular el tiempo total (cuando el último metrónomo se detiene)
tiempo_total <- 300  # segundos

# Generar ticks para cada metrónomo
datos_ticks <- data.frame()
for(i in 1:n_metronomos) {
  ticks_tiempo <- seq(0, tiempo_total, by = duraciones[i])
  # La cuerda se agota antes en metrónomos más rápidos
  max_ticks <- rpois(1, tempos[i] * 3)  # Aproximadamente 3 minutos de cuerda
  if(length(ticks_tiempo) > max_ticks) {
    ticks_tiempo <- ticks_tiempo[1:max_ticks]
  }
  if(length(ticks_tiempo) > 0) {
    datos_ticks <- rbind(datos_ticks, data.frame(
      metronomo = i,
      tiempo = ticks_tiempo,
      tempo = tempos[i]
    ))
  }
}

# Gráfico
ggplot(datos_ticks, aes(x = tiempo, y = metronomo, color = tempo)) +
  geom_point(shape = 124, size = 0.3, alpha = 0.6) +  # shape 124 = línea vertical
  scale_color_gradientn(colors = c("#1A5276", "#6C3483", "#922B21", "#D4AC0D"),
                        name = "Tempo (BPM)") +
  labs(title = "Poème Symphonique — György Ligeti (1962)",
       subtitle = "100 metrónomos, 100 tempos. La materia se sincroniza al agotarse.",
       x = "Tiempo (segundos)",
       y = "Metrónomo nº") +
  theme_minimal(base_size = 14) +
  theme(plot.title = element_text(face = "bold", size = 18, hjust = 0.5),
        plot.subtitle = element_text(color = "gray40", size = 12, hjust = 0.5),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank(),
        legend.position = "bottom")


