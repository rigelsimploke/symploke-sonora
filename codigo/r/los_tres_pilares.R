library(ggplot2)

crear_circulo <- function(x0, y0, r, n = 200) {
  theta <- seq(0, 2*pi, length.out = n)
  data.frame(x = x0 + r * cos(theta), y = y0 + r * sin(theta))
}

c1 <- crear_circulo(0, 0.5, 1.3)
c1$pilar <- "Symploké"
c2 <- crear_circulo(-0.9, -0.5, 1.3)
c2$pilar <- "Discontinuidad\nde la materia"
c3 <- crear_circulo(0.9, -0.5, 1.3)
c3$pilar <- "No-monismo"

circulos <- rbind(c1, c2, c3)

etiquetas <- data.frame(
  x = c(0, -1.5, 1.5),
  y = c(1.2, -1.5, -1.5),
  label = c("Symploké\n(συμπλοκή)", "Discontinuidad\nde la materia", "No-monismo\n(μόνος)")
)

ggplot() +
  geom_polygon(data = circulos, aes(x = x, y = y, fill = pilar, group = pilar), 
               alpha = 0.35) +
  geom_text(data = etiquetas, aes(x = x, y = y, label = label), 
            size = 5, fontface = "bold", color = "gray20") +
  annotate("text", x = 0, y = -2.2, 
           label = "Materialismo Filosófico — Escuela de Toledo", 
           size = 5.5, fontface = "italic", color = "gray10") +
  annotate("text", x = 0, y = 2.5, 
           label = "Los Tres Pilares del Pluralismo de Gustavo Bueno", 
           size = 6, fontface = "bold") +
  scale_fill_manual(values = c("#2B579A", "#B7472A", "#D4A017"), guide = "none") +
  coord_fixed() +
  theme_void()
