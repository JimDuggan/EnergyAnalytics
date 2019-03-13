library(readr)
library(dplyr)
library(ggplot2)
library(tidyr)
library(lubridate)

d <- read_csv("code/data/Ireland300Years.csv")

nd <- d %>% mutate(Date=ymd(paste0(Date,"28")),
                   MonthNumber=as.integer(month(Date)),
                   Month=month(Date,label = T),
                   Year=as.integer(year(Date)),
                   Season=case_when(
                     MonthNumber %in% c(12,1, 2)  ~ "Winter",
                     MonthNumber  %in% c(3,4,5)   ~ "Spring",
                     MonthNumber  %in% c(6,7,8)   ~ "Summer",
                     MonthNumber  %in% c(9,10,11) ~ "Autumn")
                   )

sm <- nd %>% group_by(Month) %>% 
             summarise(Average=mean(Precip.MM),
                       Max=max(Precip.MM),
                       YearMax=Year[which(Precip.MM==max(Precip.MM))],
                       Min=min(Precip.MM),
                       YearMin=Year[which(Precip.MM==min(Precip.MM))])

an <- nd %>% group_by(Year) %>%
      summarise(Total=sum(Precip.MM))

ggplot(an)+geom_line(aes(x=Year,y=Total))+
  geom_smooth(aes(x=Date,y=Precip.MM))+facet_grid(Month ~ .)

ggplot(nd)+geom_line(aes(x=Date,y=Precip.MM,colour=Month))+
  geom_smooth(aes(x=Date,y=Precip.MM))+facet_grid(Month ~ .)

ggplot(nd)+geom_line(aes(x=Date,y=Precip.MM,colour=Season))+
  ylab("Rainfall (mm)")+
  xlab("Year")+
  facet_grid(Season ~ .)+
  guides(colour=FALSE)


ggplot(nd)+geom_line(aes(x=Date,y=Precip.MM,colour=Month))+
  facet_grid(Month ~ .)

ggplot(nd)+geom_line(aes(x=Date,y=Precip.MM))

nd %>% group_by(Month) %>% 
       summarise(Average=mean(Precip.MM),
                 Max=max(Precip.MM),
                 YearMax=Year[which(Precip.MM==max(Precip.MM))],
                 Min=min(Precip.MM),
                 YearMin=Year[which(Precip.MM==min(Precip.MM))])


nd %>% group_by(Season) %>% 
  summarise(Average=mean(Precip.MM),
            Max=max(Precip.MM),
            YearMax=Year[which(Precip.MM==max(Precip.MM))],
            Min=min(Precip.MM),
            YearMin=Year[which(Precip.MM==min(Precip.MM))])

write.csv(x = nd, "code/data/Ireland300YearsUpdated.csv")
