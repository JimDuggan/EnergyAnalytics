library(ggplot2)
library(dplyr)

data <- ggplot2::mpg

summary(data)

glimpse(data)

slice(data,1:10)

r1 <- filter(data,displ > 6.0)

filter(data,displ > 6.0,drv==4)

filter(data,cty>1.5*mean(cty))

arrange(data,desc(hwy))

arrange(data,desc(year,displ))

select(data,model, displ, cyl, drv, hwy)

select(data,starts_with("c"))

select(data,ends_with("l"))

mutate(data,Mpg_Diff=hwy-cty) %>% 
  select(model,year,hwy,cty,Mpg_Diff)

data %>% group_by(manufacturer) %>% 
  summarise(AvrCty=mean(cty),AvrHwy=mean(hwy))

data %>% group_by(class) %>% 
  summarise(AvrCty=mean(cty),AvrHwy=mean(hwy))

data %>% group_by(manufacturer,year) %>% 
  summarise(AvrCty=mean(cty),AvrHwy=mean(hwy))






