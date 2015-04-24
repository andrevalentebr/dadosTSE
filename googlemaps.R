################################################################################

## Arquivo de Estudos de Plotagem de dados Georeferenciados
## André Valente do Couto
## 23.04.2015

# googlemaps.r      

################################################################################


################################################################################
#
# EXEMPLO 01
#

# instalar e referenciar a biblioteca apenas uma vez
install.packages("ggmap")
library(ggmap)
library(grid)

# sitio na no google maps para visualizar a imagem a ser buscada
# o primeiro valor é a latitude o segundo é a longitude e o 14z indica o valor
# do zoom na imagem visualizada pelo google maps.
# https://www.google.com.br/maps/@-15.5900687,-56.0797237,14z?hl=pt-BR
# função getmap que pega o mapa do google maps
cuiabaMap2 = get_map(location = c(lon = -56.0797237, lat = -15.5900687), 
                     zoom = 14, maptype = 'roadmap', source = "google")
# função ggmap georeferencia a imagem buscada
cuiabaMap2 = ggmap(cuiabaMap2)
# exibe a imagem do mapa
cuiabaMap2
# alimenta com uma constante o valor da semente utilizada nas funções de
# aleatoriedade (isso não é necessário em um mapa funcional)
set.seed(1234)
# num caso real voce teria uma lista com 40 casos de dados de longitude
# a função runif preenche 40 itens com valores aleatórios mín e max
# tanto para a variável lon (longitude) como para lat (latitude)
lon <- runif (40, -56.10, -56.06)
lat <- runif (40, -15.61, -15.57) 
# a função rnorm gera 40 itens aleatórios, com média 20 e desvio padrão 19
votos = rnorm (40, 20, 19)
# com as 3 variáveis, basta juntá-las em uma tabela myd
# Em um caso real, você já deveria ter os casos (votos) com suas indicações
# geográficas (latitude e longitude).
myd <- data.frame (lon, lat, votos)
# Por fim, plota a imagem e os dados sobre a imagem
cuiabaMap2 +  geom_point(
    aes(x = lon, y = lat, colour = votos, size = votos, alpha = 0.9),
    data = myd)  + scale_colour_gradient(low="yellow", high="red")

