using Gadfly
distribuicao = readtable("data/distribuicao-2015-brasil.tsv")


myplot = Gadfly.plot(
    layer(x=distribuicao[:populacao], y=distribuicao[:renda],
Geom.point, Geom.smooth(method=:loess,smoothing=0.8), Theme(default_color=colorant"red")),
    layer(x=[0,1],y=[0,1],Geom.path()),
    Coord.cartesian(xmin=0, xmax=1, ymin=0, ymax=1),
Guide.xlabel("População - %"),Guide.ylabel("Renda - %"),
Guide.title("Curva de Lorenz")
)

draw(PNG("./images/curva-de-lorenz.png", 4inch, 3inch), myplot)
