#import "@preview/simple-plot:1.1.0": plot, scatter
#import "../styles.typ": navy, burgundy, paper

= Métodos

Se realizó un análisis descriptivo mediante regresión lineal simple con las cuatro parejas de datos de la actividad, presentadas en la @tab:datos. La publicidad ($x$) está expresada en miles de unidades monetarias y las ventas ($y$), en unidades; la escala de estas últimas no se especifica.

#figure(
  table(
    columns: (1fr, 1fr),
    align: center,
    fill: (x, y) => if y == 0 {
      navy
    } else if calc.odd(y) {
      paper
    } else {
      none
    },
    table.header(
      text(fill: white, weight: "bold")[Publicidad (miles)],
      text(fill: white, weight: "bold")[Ventas],
    ),
    [5], [52],
    [7], [58],
    [10], [65],
    [12], [70],
  ),
  caption: [Datos de gasto en publicidad y ventas utilizados en el análisis.],
) <tab:datos>

#figure(
  block(width: 100%, height: 6.6cm, align(center, plot(
    xmin: 4.5,
    xmax: 12.5,
    ymin: 50,
    ymax: 72,
    width: 15cm,
    height: 5cm,
    xlabel: [Publicidad (miles)],
    ylabel: [Ventas (unidades)],
    show-grid: "major",
    axis-x-pos: "bottom",
    axis-y-pos: "left",
    (
      fn: x => 2.5345 * x + 39.7069,
      stroke: navy + 1.2pt,
      label: [Recta ajustada],
    ),
    scatter(
      ((5, 52), (7, 58), (10, 65), (12, 70)),
      mark: "*",
      mark-fill: burgundy,
      mark-size: 0.3,
    ),
  ))),
  caption: [Gasto publicitario y ventas observadas, con la recta de regresión lineal ajustada.],
)

Se ajustó una recta por mínimos cuadrados, minimizando la suma de las diferencias cuadráticas entre ventas observadas y estimadas @NISTLeastSquares. La pendiente se calculó dividiendo la suma de los productos de las desviaciones de $x$ y $y$ entre la suma de cuadrados de las desviaciones de $x$, y la ordenada al origen mediante $bar(y) - b_1 bar(x)$. Con las medias $bar(x) = 8.5$ y $bar(y) = 61.25$, se obtiene $b_1 = 73.5 / 29 approx 2.5345$ y $b_0 approx 39.7069$. Finalmente, se calcularon las estimaciones y sus diferencias respecto de las ventas observadas. Por tratarse de solo cuatro datos, el análisis es descriptivo y no incluye validación independiente.