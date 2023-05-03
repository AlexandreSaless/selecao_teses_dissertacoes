########################
## selecao de teses e dissertacoes
## download em https://dadosabertos.capes.gov.br/dataset
#######################

library(tidyverse)
library(dplyr)

#escolher o diretorio de trabalho 
setwd("")

#litura de dados em outro campos
#caso retorne erro realizar o download novamente dos dados

dados13<-read.csv2("br-capes-btd-2013a2016-2017-12-01_2013.csv")
dados14<-read.csv2("br-capes-btd-2013a2016-2017-12-01_2014.csv")
dados15<-read.csv2("br-capes-btd-2013a2016-2017-12-01_2015.csv")
dados16<-read.csv2("br-capes-btd-2013a2016-2017-12-01_2016.csv")
dados17<-read.csv2("br-capes-btd-2017a2020-2021-12-03_2017.csv") %>% mutate(IN_TCC_COM_VINCULO_PRODUCAO=NULL, ID_ADD_PRODUCAO_VINCULO_CT=NULL)
dados18<-read.csv2("br-capes-btd-2017a2020-2021-12-03_2018.csv") %>% mutate(IN_TCC_COM_VINCULO_PRODUCAO=NULL, ID_ADD_PRODUCAO_VINCULO_CT=NULL)
dados19<-read.csv2("br-capes-btd-2017a2020-2021-12-03_2019.csv") %>% mutate(IN_TCC_COM_VINCULO_PRODUCAO=NULL, ID_ADD_PRODUCAO_VINCULO_CT=NULL)
dados20<-read.csv2("br-capes-btd-2017a2020-2021-12-03_2020.csv") %>% mutate(IN_TCC_COM_VINCULO_PRODUCAO=NULL, ID_ADD_PRODUCAO_VINCULO_CT=NULL)
dados<-rbind(dados13,dados14,dados15,dados16,dados17,dados18,dados19,dados20) #unindo os dados
rm(dados13,dados14, dados15,dados16,dados17,dados18,dados19,dados20) #removendo variaveis nao necessarias

#######################################################
## selecao de dados

selecao<-dados %>% filter(str_detect(DS_RESUMO, "INICIAÇÃO CIENTÍFICA")|
                            str_detect(DS_PALAVRA_CHAVE, "INICIAÇÃO CIENTÍFICA")|
                            str_detect(NM_PRODUCAO, "INICIAÇÃO CIENTÍFICA")) %>% 
                    filter(str_detect(DS_RESUMO, "FORMAÇÃO")|
                             str_detect(DS_PALAVRA_CHAVE, "FORMAÇÃO")|
                             str_detect(NM_PRODUCAO, "FORMAÇÃO")) %>% 
                    filter(str_detect(DS_RESUMO, "PROFESSOR")|
                             str_detect(DS_RESUMO, "DOCENTE")|
                             str_detect(DS_PALAVRA_CHAVE, "PROFESSOR")|
                             str_detect(DS_PALAVRA_CHAVE, "DOCENTE")|
                             str_detect(NM_PRODUCAO, "PROFESSOR")|
                             str_detect(NM_PRODUCAO, "DOCENTE"))


write.csv2(selecao, file = "seleção.csv")