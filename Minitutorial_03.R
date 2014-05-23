
## ------------------------------------------------------------------------
mylocal.path <- "C:/Users/Diego/Documents/GitHub/R-Notes";
setwd(mylocal.path);
specdata.files <- dir("./specdata", full.names=T);


## ------------------------------------------------------------------------
is(specdata.files);


## ------------------------------------------------------------------------
file.headings <- list();


## ------------------------------------------------------------------------
for(i in 1:length(specdata.files)){
 
 file.headings <- append(file.headings, 
                         list(names(read.csv(specdata.files[i],nrows = 1))))
};


## ------------------------------------------------------------------------
unlist(unique(file.headings));


## ------------------------------------------------------------------------
unique.headings <- unique(file.headings);


## ------------------------------------------------------------------------
 equal.headings <- vector();


## ------------------------------------------------------------------------
   for(i in 1:length(file.headings)){
     equal.headings <- c(equal.headings, 
                         identical(unique.headings, file.headings[i]))
   };


## ------------------------------------------------------------------------
length(equal.headings[equal.headings==F]);


## ------------------------------------------------------------------------
 length(equal.headings[equal.headings==T]);


## ------------------------------------------------------------------------
which(equal.headings==F);
which(equal.headings==T);


## ------------------------------------------------------------------------
specdata.files[which(equal.headings==T)];


