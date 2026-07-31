library(ggplot2)

monocordio <- data.frame(
  proporcion = factor(c("1:1", "2:1", "3:2", "4:3", "5:4", "6:5"),
                      levels = c("1:1", "2:1", "3:2", "4:3", "5:4", "6:5")),
  ratio = c(1, 2, 1.5, 1.333, 1.25, 1.2),
  intervalo = c("Unísono", "Octava", "Quinta", "Cuarta", "Tercera Mayor", "Tercera menor"),
  descubridor = c("Unísono", "Pitágoras", "Pitágoras", "Pitágoras", "Posterior", "Posterior")
)

ggplot(monocordio, aes(x = proporcion, y = ratio, fill = descubridor)) +
  geom_col(width = 0.6, color = "white", linewidth = 0.5) +
  geom_text(aes(label = intervalo), vjust = -0.5, size = 4.5, fontface = "italic") +
  scale_fill_manual(values = c("Pitágoras" = "#D4AC0D", 
                                "Posterior" = "#922B21",
                                "Unísono" = "gray70"),
                    guide = "none") +
  geom_hline(yintercept = 1, linetype = "dashed", color = "gray50") +
  labs(title = "El Monocordio de Pitágoras",
       subtitle = "Proporciones matemáticas de las consonancias — s. VI a.C.",
       x = "Proporción de la cuerda",
       y = "Ratio de frecuencia") +
  theme_minimal(base_size = 14) +
  theme(plot.title = element_text(face = "bold", size = 18),
        plot.subtitle = element_text(color = "gray40"))
