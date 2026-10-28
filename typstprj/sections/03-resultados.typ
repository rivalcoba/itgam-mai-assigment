#import "../styles.typ": navy, paper
#import "../components.typ": result-card

= Resultados

El ajuste por mínimos cuadrados de las cuatro observaciones es:

$ hat(y) = 2.5345 x + 39.7069 $ <eq:regresion-publicidad-ventas>

La forma ajustada, indicada por @eq:regresion-publicidad-ventas, emplea $x$ para el gasto publicitario en miles y $hat(y)$ para las ventas estimadas.

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 4mm,
  result-card(
    [Observaciones],
    [4],
    [Parejas de publicidad y ventas analizadas.],
  ),
  result-card(
    [Pendiente],
    [2.53],
    [Unidades de venta estimadas por cada mil de publicidad.],
  ),
  result-card(
    [Estimación para x = 15],
    [77.72],
    [Extrapolación en unidades de venta.],
  ),
)

#figure(
  table(
    columns: (1.2fr, 1fr, 1fr, 1fr),
    align: (left, center, center, left),
    fill: (x, y) => if y == 0 {
      navy
    } else if calc.odd(y) {
      paper
    } else {
      none
    },
    table.header(
      text(fill: white, weight: "bold")[Condición],
      text(fill: white, weight: "bold")[Observada],
      text(fill: white, weight: "bold")[Estimada],
      text(fill: white, weight: "bold")[Observada - estimada],
    ),
    [Publicidad: 5], [52], [52.38], [-0.38],
    [Publicidad: 7], [58], [57.45], [0.55],
    [Publicidad: 10], [65], [65.05], [-0.05],
    [Publicidad: 12], [70], [70.12], [-0.12],
  ),
  caption: [Ventas observadas, estimadas por la recta y diferencias para cada nivel de publicidad.],
)

La relación observada es creciente: las ventas aumentan conforme aumenta la publicidad. Las diferencias entre los valores observados y los estimados son menores a una unidad en los cuatro casos. Al sustituir $x = 15$ en la recta se obtiene $hat(y) approx 77.72$ unidades de venta. Esta estimación queda fuera del intervalo de publicidad observado, que va de 5 a 12 miles.