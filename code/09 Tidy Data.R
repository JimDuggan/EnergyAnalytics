library(readr)
library(tidyr)
library(dplyr)

wd <- read_csv("code/data/ExamDataCsv.csv")

td <- gather(wd,key=Subject,value=Mark,
                CX1000:CX1009)

ad <- td %>%
       group_by(StudentID) %>%
       summarise(AverageGrade = mean(Mark),
                 MaxGrade     = max(Mark),
                 MinGrade     = min(Mark))


