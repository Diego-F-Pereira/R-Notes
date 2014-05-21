# Let's first create a data frame:
df <- data.frame(col1 = numeric(2),
                 col2 = numeric(2),
                 stringsAsFactors = F)

# Now let's assign some values.
df[1,1] <- 1
df[1,2] <- 0.5
df[2,1] <- 2
df[2,2] <- 0.25
df

# Let's create a variable for passing the name of the column.
# Uncomment one by one and see the results.

# my.column <- "col1"
my.column <- "col2"
# my.column <- "col3"

if(my.column == "col1"){
  sum(df$col1)
} else if(my.column == "col2"){
  sum(df$col2)
} else{
  cat("The column",my.column,"is not part of the data frame df.")
}

ifelse(my.column %in% names(df), 
       sum(df[,my.column]),
       "The column does not exist at the df data frame.")

switch(my.column,
       col1 = mean(df$col1),
       col2 = log10(df$col2),
       stop("The column does not exist at the df data frame."))