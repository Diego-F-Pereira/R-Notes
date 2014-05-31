
## ------------------------------------------------------------------------
rm(list=ls())
gc()
my.path <- "C:/Users/Diego/Documents/Reproducible Research/PA2"
setwd(my.path)
fileZip <- "./StormData.csv.bz2"
fileUnz <- "./StormData.csv"


## ------------------------------------------------------------------------
library(R.utils)
if(file.exists(fileUnz)==F){
  system.time(bunzip2(fileZip))
}


## ------------------------------------------------------------------------
con <- file(fileZip, "rb")
system.time(nrec01 <- countLines(con))
close(con)
nrec01


## ------------------------------------------------------------------------
system.time(nrec01 <- countLines(fileZip))
nrec01


## ----hk1,echo=FALSE,results='hide'---------------------------------------
rm(nrec01)
gc()


## ------------------------------------------------------------------------
system.time(nrec02 <- countLines(fileUnz))
nrec02


## ----hk2,echo=FALSE,results='hide'---------------------------------------
rm(nrec02)
gc()


## ------------------------------------------------------------------------
system.time(nrec03 <- length(scan(file = fileZip, what = list(""), n = -1, sep = "\n")[[1]]))
nrec03


## ----hk3,echo=FALSE,results='hide'---------------------------------------
rm(nrec03)
gc()


## ------------------------------------------------------------------------
system.time(nrec04 <- length(scan(file = fileUnz, what = list(""), n = -1, sep = "\n")[[1]]))
nrec04


## ----hk4,echo=FALSE,results='hide'---------------------------------------
rm(nrec04)
gc()


## ------------------------------------------------------------------------
library(data.table)
a <- fread(fileUnz)


## ----hk5,echo=FALSE,results='hide'---------------------------------------
rm(a)
gc()


## ------------------------------------------------------------------------
nrec05 <- 0
nlines <-function(d) {
  nrec05 <<- nrec05 + nrow(d)
}
library(HadoopStreaming)
con <- bzfile(fileZip, "rb")
system.time(d <- hsTableReader(con, FUN=nlines))
close(con)
nrec05


## ----hk6,echo=FALSE,results='hide'---------------------------------------
rm(nrec05)
gc()


## ------------------------------------------------------------------------
nrec06 <- 0
nlines <-function(d) {
  nrec06 <<- nrec06 + nrow(d)
}
con <- file(fileUnz,open="r")
system.time(d <- hsTableReader(con, FUN=nlines))
close(con)
nrec06


## ----hk7,echo=FALSE,results='hide'---------------------------------------
rm(nrec06)
gc()


## ------------------------------------------------------------------------
nrec07 <- 0
nlines <-function(d) {
  nrec07 <<- nrec07 + length(d)
}
con <- bzfile(fileZip, "rb")
system.time(d <- hsLineReader(con, FUN=nlines))
close(con)
nrec07


## ----hk8,echo=FALSE,results='hide'---------------------------------------
rm(nrec07)
gc()


## ------------------------------------------------------------------------
nrec08 <- 0
nlines <-function(d) {
  nrec08 <<- nrec08 + length(d)
}
library(HadoopStreaming)
con <- file(fileUnz,open="r")
system.time(d <- hsLineReader(con, FUN=nlines))
close(con)
nrec08


## ----hk9,echo=FALSE,results='hide'---------------------------------------
rm(nrec08)
gc()


## ------------------------------------------------------------------------
system.time(nrec09 <- as.numeric(shell('type "StormData.csv" | find /c ","', intern=T)))
nrec09


## ----hk10,echo=FALSE,results='hide'--------------------------------------
rm(nrec09)
gc()


## ------------------------------------------------------------------------
system.time(nrec10 <- as.numeric(shell('type "StormData.csv" | find /v /c ""', intern=T)))
nrec10


## ----hk11,echo=FALSE,results='hide'--------------------------------------
rm(nrec10)
gc()


## ------------------------------------------------------------------------
system.time(nrec11 <- as.numeric(shell('type "StormData.csv.bz2" | find /c ","', intern=T)))
nrec11


## ----hk12,echo=FALSE,results='hide'--------------------------------------
rm(nrec11)
gc()


## ------------------------------------------------------------------------
system.time(nrec12 <- as.numeric(shell('type "StormData.csv.bz2" | find /v /c ""', intern=T)))
nrec12


## ----hk13,echo=FALSE,results='hide'--------------------------------------
rm(nrec12)
gc()


## ------------------------------------------------------------------------
storm.data <- read.csv(fileZip, stringsAsFactors = F, nrows = 10)
classes <- sapply(storm.data, class)


## ----hk14,echo=FALSE,results='hide'--------------------------------------
rm(storm.data)
gc()


## ----Crash---------------------------------------------------------------
Sys.time()
system.time(storm.data <- read.csv(fileZip, 
                                   header = TRUE,
                                   stringsAsFactors = F,
                                   comment.char = "",
                                   colClasses = classes))
Sys.time()


## ----hk15,echo=FALSE,results='hide'--------------------------------------
gc()


## ----!nrows--------------------------------------------------------------
Sys.time()
system.time(storm.data <- read.csv(fileZip, 
                                   header = TRUE,
                                   stringsAsFactors = F,
                                   comment.char = "",
                                   colClasses = "character"))
Sys.time()


## ----hk16,echo=FALSE,results='hide'--------------------------------------
rm(storm.data)
gc()


## ----nrows---------------------------------------------------------------
Sys.time()
system.time(nrec12 <- as.numeric(
  shell('type "StormData.csv.bz2" | find /v /c ""',
        intern=T)))
nrec12 <- nrec12 * 2
system.time(storm.data <- read.csv(fileZip, 
                                   stringsAsFactors = F,
                                   comment.char = "",
                                   colClasses = "character",
                                   nrows = nrec12))
Sys.time()


## ----hk17,echo=FALSE,results='hide'--------------------------------------
rm(storm.data)
gc()


## ----RAMconsumption------------------------------------------------------
file1 <- "./Table1.txt"
file2 <- "./Table3.txt"

x <- read.csv(file1,
              stringsAsFactors = F,
              comment.char = "",
              colClasses = c("integer",
                             "character",
                             "integer"))
y <- read.csv(file2,
              stringsAsFactors = F,
              comment.char = "",
              colClasses = c("integer",
                             "character",
                             "integer"))

x$RAM <- as.integer(round(x$RAM * 0.000976562),0)
y$RAM <- as.integer(round(y$RAM * 0.000976562),0)

plot(x$ID,
     x$RAM,     
     type = "l",
      col = "blue",
     xlab = "Time (seconds)",
     ylab = "RAM Consumption (Megabytes)")
lines(y$RAM,
      type = "l",
       col = "red")
legend("topleft", legend = c("Without nrows", "With nrows"),
       col = c('blue','red'), lty = 1,lwd = 1.5) 


## ----hk18,echo=FALSE,results='hide'--------------------------------------
rm(list=ls())
gc()


