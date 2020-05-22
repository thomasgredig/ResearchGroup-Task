# prepares data for fitting
# random slopes

NUM = 100    # number of data sets
noise = 8   # noise

makeSlopeData <- function(f=1) {
  slope = runif(1,min=5,max=10)
  x = 1:100
  b = runif(1, min=-5, max=5)
  y = slope*(x+runif(length(x))*f) + b + runif(length(x))*f
  data.frame(x,y)
}

d = data.frame()
for(n in 1:NUM) {
  d1 = makeSlopeData(15)
  d1$name = paste0('No',n)
  d = rbind(d, d1)
}

write.csv(d, 'data/fit-data.csv', row.names = FALSE)