#
# Coletar os Dados do TSE - André Valente
#
#  E L E I T O R A D O
# se não digitar nada a função baixaEleitorado faz download de todos os aquivos 
# de Eleitorado do TSE. Se quiser de um ano específico digitar o ano, se desejar
# alguns anos, usar a expressão c(ano1, ano2, ...) no argumento da função. 
# Ex: baixaEleitorado(c(1994,1995,1996,1997)) baixa só os dados de 1994 e 1996.
baixaEleitorado <- function(anos = seq(1994, 2014,2)) {
    setwd("/home/andre/R/TSE/")
    anosvalidos <- seq(1994, 2014,2)
    if(!file.exists("dadosTSE")){
        dir.create("dadosTSE")
    }
    # URL completo urlBase + ano + .zip
    urlBase <- paste("http://agencia.tse.jus.br/estatistica/sead/",
                     "odsele/perfil_eleitorado/perfil_eleitorado_", sep="")
    # loop que faz download de cada ano solicitado
    for (ano in anos) {
        # valida a entrada somente para anos eleitorais vaĺidos
        if (sum(ano == anosvalidos)==0) {next} 
        fileURL <- paste(urlBase, ano, ".zip", sep="")
        destFile <- paste("./dadosTSE/perfil_eleitorado_", ano,".zip", sep="")
        download.file(url = fileURL, destfile = destFile)
     }
}
# 
#  R E S U L T A D O S    E L E I T O R A I S
# Parâmetro anos permite escolher os anos dos resultados eleitorais 
# a serem baixados do sitio do TSE. Os outros campos define qual resultado
# se deseja obter: 
# 
# no argumento da função. Exemplo: baixaEleitorado(c(1994,1996)) baixa automaticamente os dados de 1994 e 1996.
anos
baixaResultados <- function(anos = seq(1994, 2014,2), cand_munzona = FALSE, 
                            part_munzona = FALSE, vot_secao = FALSE, 
                            vot_munzona = FALSE, detalhe_vot_secao = FALSE) {
 
    

http://agencia.tse.jus.br/estatistica/sead/odsele/votacao_candidato_munzona/votacao_candidato_munzona_2014.zip

http://agencia.tse.jus.br/estatistica/sead/odsele/votacao_partido_munzona/votacao_partido_munzona_1994.zip
http://agencia.tse.jus.br/estatistica/sead/odsele/votacao_partido_munzona/votacao_partido_munzona_2014.zip

http://www.tse.jus.br/hotSites/pesquisas-eleitorais/resultados_anos/votacao/votacao_secao_eleitoral_1994.html
http://www.tse.jus.br/hotSites/pesquisas-eleitorais/resultados_anos/votacao/votacao_secao_eleitoral_2014.html

http://agencia.tse.jus.br/estatistica/sead/odsele/detalhe_votacao_munzona/detalhe_votacao_munzona_1994.zip
http://agencia.tse.jus.br/estatistica/sead/odsele/detalhe_votacao_munzona/detalhe_votacao_munzona_2014.zip

http://agencia.tse.jus.br/estatistica/sead/odsele/detalhe_votacao_secao/detalhe_votacao_secao_1994.zip
http://agencia.tse.jus.br/estatistica/sead/odsele/detalhe_votacao_secao/detalhe_votacao_secao_2014.zip
}
    



