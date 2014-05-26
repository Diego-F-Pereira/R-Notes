R-Notes
=======
This repo contains my personal notes for using R.

All files have been written using R markdown.

Each folder in the repo contains the same files in different format so you can decide how you want to visualize them.

* If you want to read the explanations and code on-line without actually running the code, choose the **md** folder.
* If you want to read the explanations and code locally without actually running the code, **fork** the repo, **clone** it into your computer, go to the **html** folder, and open the **html** files.
* If you want to read the explanations and run the code locally, **fork** the repo, **clone** it into your computer, go to the **Rmd** folder, and open the **Rmd** files in R.
* If you want only to run the R code go to the **R** folder and run the **R** files in R.
	
In case you find that I forgot to update the R files (that happened) use the **purl()** function from the **knitr** package for extracting the **R** code from the **Rmd** files:

	library(knitr)
	purl("./Minitutorial_01.Rmd")
	purl("./Minitutorial_02.Rmd")
	purl("./Minitutorial_03.Rmd")
	# etc

Cheers!