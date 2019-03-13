library(ggplot2)

dt <- ggplot2::mpg

ggplot(data = dt) +
  geom_point(mapping = aes(x=displ,y=hwy))

ggplot(data = dt) +
  geom_point(mapping = aes(x=displ,y=hwy,colour=class))

ggplot(data = dt) +
  geom_point(mapping = aes(x=displ,y=hwy)) + facet_wrap(~class)

ggplot(data = dt) +
  geom_point(mapping = aes(x=displ,y=hwy,colour=class)) +
  facet_wrap(~manufacturer)




