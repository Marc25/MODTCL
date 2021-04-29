# Ejemplo de Modelización de time series basada en tidymodels y modeltime library
# 1.0 Librerias ----
# https://github.com/Marc25/ModTC.git
library(tidyverse)
library(tidymodels)
library(modeltime)
library(modeltime.ensemble)
library(modeltime.resample)
library(timetk)
library(forecast)
# 2.0 Data ----
# Lectura de Bikesharing UCI dataset
data <- read.csv2("/cloud/project/data/BikeSharing_day.csv", sep = ",", dec=".")
data_ts <- ts(data$casual, frequency = 365, start = c(2011,1))
autoplot(data_ts)
# - 2.1 Explore Dataset ---- 
walmart_sales_weekly
tibble(data)
walmart_sales_weekly %>% group_by(id) %>% 
  plot_time_series(.date_var = Date ,.value=Weekly_Sales, 
                   .facet_ncol = 3, .interactive = FALSE)

walmart_sales_weekly %>% 
  plot_seasonal_diagnostics(.date_var = Date, .value = Weekly_Sales)

walmart_sales_weekly %>% 
  plot_anomaly_diagnostics(.date_var = Date, .value = Weekly_Sales)


# - 2.2 Train y Test ----
FORECAST_HORIZON <- 52
walmart_sales_weekly %>% 
  select(id, Date, Weekly_Sales)%>%
  group_by(id)%>%
  future_frame(.date_var = Date,
               .length_out = FORECAST_HORIZON,
               .bind_data = TRUE
  )%>%
  ungroup()

# 3.0 Feature Engine ----
# 4.0 Modelización ----
# 5.0 Evaluation ----



