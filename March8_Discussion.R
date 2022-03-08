library(tidyverse)
library(dplyr)
library(ggplot2)
library(ggpubr)

vaccine_rates <- readr::read_csv("CountyData.csv")
vaccine_rates_tidy <- rename(vaccine_rates, county = "County Name", est_hesitant = "Estimated hesitant", est_strong_hesitant = "Estimated strongly hesitant", svi= "Social Vulnerability Index (SVI)", svi_cat = "SVI Category", cvac_level_rates = "CVAC level of concern for vaccination rollout", cvac_level = "CVAC Level Of Concern", percent_vac = "Percent adults fully vaccinated against COVID-19 (as of 6/10/21)")

regression <- lm(percent_vac~est_strong_hesitant+cvac_level_rates+svi, data = vaccine_rates_tidy)
summary(regression)$coefficient
