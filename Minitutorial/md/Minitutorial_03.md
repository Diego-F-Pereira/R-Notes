Minitutorial 3
========================================================

Checking headings
-----------------
Now, I would like to know if all headings or column names for all files
are the same, before doing anything else with those data.

So, the first thing I'll do is to get all file names into a vector

```r
mylocal.path <- "C:/Users/Diego/Documents/GitHub/R-Notes"
setwd(mylocal.path)
specdata.files <- dir("./specdata", full.names = T)
```

Let's check what kind of object R just built:

```r
is(specdata.files)
```

```
## [1] "character"           "vector"              "data.frameRowLabels"
## [4] "SuperClassMethod"
```

Since I don't know how many columns each file has, I'll need to use a list
of lists. This is because a data frame or a matrix will truncate the
number of columns after the first element gets inserted.  

Let's initialize our list first:

```r
file.headings <- list()
```

Now let's loop through all files and get their headings:

```r
for (i in 1:length(specdata.files)) {
    
    file.headings <- append(file.headings, list(names(read.csv(specdata.files[i], 
        nrows = 1))))
}
```

Let's check the unique headings:

```r
unlist(unique(file.headings))
```

```
## [1] "Date"    "sulfate" "nitrate" "ID"
```

Now let's see if all files have the same headings.
For that I'm going to compare all captured headings against the resultant
unique headings.
Let's first store the list of unique headings into a variable.

```r
unique.headings <- unique(file.headings)
```

Before starting the comparisons, I'm going to create a logical vector, or
in other words, a vector that will contain only TRUE or FALSE values for
storing the results of the comparisons.

```r
equal.headings <- vector()
```

Now let's run the comparisons:

```r
for (i in 1:length(file.headings)) {
    equal.headings <- c(equal.headings, identical(unique.headings, file.headings[i]))
}
```

Let's check how many comparisons returned FALSE:

```r
length(equal.headings[equal.headings == F])
```

```
## [1] 0
```

And how many returned TRUE:

```r
length(equal.headings[equal.headings == T])
```

```
## [1] 332
```

In case we wanted to know which files returned TRUE or FALSE, we could use
the which() function:

```r
which(equal.headings == F)
```

```
## integer(0)
```

```r
which(equal.headings == T)
```

```
##   [1]   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17
##  [18]  18  19  20  21  22  23  24  25  26  27  28  29  30  31  32  33  34
##  [35]  35  36  37  38  39  40  41  42  43  44  45  46  47  48  49  50  51
##  [52]  52  53  54  55  56  57  58  59  60  61  62  63  64  65  66  67  68
##  [69]  69  70  71  72  73  74  75  76  77  78  79  80  81  82  83  84  85
##  [86]  86  87  88  89  90  91  92  93  94  95  96  97  98  99 100 101 102
## [103] 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119
## [120] 120 121 122 123 124 125 126 127 128 129 130 131 132 133 134 135 136
## [137] 137 138 139 140 141 142 143 144 145 146 147 148 149 150 151 152 153
## [154] 154 155 156 157 158 159 160 161 162 163 164 165 166 167 168 169 170
## [171] 171 172 173 174 175 176 177 178 179 180 181 182 183 184 185 186 187
## [188] 188 189 190 191 192 193 194 195 196 197 198 199 200 201 202 203 204
## [205] 205 206 207 208 209 210 211 212 213 214 215 216 217 218 219 220 221
## [222] 222 223 224 225 226 227 228 229 230 231 232 233 234 235 236 237 238
## [239] 239 240 241 242 243 244 245 246 247 248 249 250 251 252 253 254 255
## [256] 256 257 258 259 260 261 262 263 264 265 266 267 268 269 270 271 272
## [273] 273 274 275 276 277 278 279 280 281 282 283 284 285 286 287 288 289
## [290] 290 291 292 293 294 295 296 297 298 299 300 301 302 303 304 305 306
## [307] 307 308 309 310 311 312 313 314 315 316 317 318 319 320 321 322 323
## [324] 324 325 326 327 328 329 330 331 332
```

As you can see, the which function returns the indexes, not the actual
name of the files. But we can use that for subsetting our vector
'specdata.files':

```r
specdata.files[which(equal.headings == T)]
```

```
##   [1] "./specdata/001.csv" "./specdata/002.csv" "./specdata/003.csv"
##   [4] "./specdata/004.csv" "./specdata/005.csv" "./specdata/006.csv"
##   [7] "./specdata/007.csv" "./specdata/008.csv" "./specdata/009.csv"
##  [10] "./specdata/010.csv" "./specdata/011.csv" "./specdata/012.csv"
##  [13] "./specdata/013.csv" "./specdata/014.csv" "./specdata/015.csv"
##  [16] "./specdata/016.csv" "./specdata/017.csv" "./specdata/018.csv"
##  [19] "./specdata/019.csv" "./specdata/020.csv" "./specdata/021.csv"
##  [22] "./specdata/022.csv" "./specdata/023.csv" "./specdata/024.csv"
##  [25] "./specdata/025.csv" "./specdata/026.csv" "./specdata/027.csv"
##  [28] "./specdata/028.csv" "./specdata/029.csv" "./specdata/030.csv"
##  [31] "./specdata/031.csv" "./specdata/032.csv" "./specdata/033.csv"
##  [34] "./specdata/034.csv" "./specdata/035.csv" "./specdata/036.csv"
##  [37] "./specdata/037.csv" "./specdata/038.csv" "./specdata/039.csv"
##  [40] "./specdata/040.csv" "./specdata/041.csv" "./specdata/042.csv"
##  [43] "./specdata/043.csv" "./specdata/044.csv" "./specdata/045.csv"
##  [46] "./specdata/046.csv" "./specdata/047.csv" "./specdata/048.csv"
##  [49] "./specdata/049.csv" "./specdata/050.csv" "./specdata/051.csv"
##  [52] "./specdata/052.csv" "./specdata/053.csv" "./specdata/054.csv"
##  [55] "./specdata/055.csv" "./specdata/056.csv" "./specdata/057.csv"
##  [58] "./specdata/058.csv" "./specdata/059.csv" "./specdata/060.csv"
##  [61] "./specdata/061.csv" "./specdata/062.csv" "./specdata/063.csv"
##  [64] "./specdata/064.csv" "./specdata/065.csv" "./specdata/066.csv"
##  [67] "./specdata/067.csv" "./specdata/068.csv" "./specdata/069.csv"
##  [70] "./specdata/070.csv" "./specdata/071.csv" "./specdata/072.csv"
##  [73] "./specdata/073.csv" "./specdata/074.csv" "./specdata/075.csv"
##  [76] "./specdata/076.csv" "./specdata/077.csv" "./specdata/078.csv"
##  [79] "./specdata/079.csv" "./specdata/080.csv" "./specdata/081.csv"
##  [82] "./specdata/082.csv" "./specdata/083.csv" "./specdata/084.csv"
##  [85] "./specdata/085.csv" "./specdata/086.csv" "./specdata/087.csv"
##  [88] "./specdata/088.csv" "./specdata/089.csv" "./specdata/090.csv"
##  [91] "./specdata/091.csv" "./specdata/092.csv" "./specdata/093.csv"
##  [94] "./specdata/094.csv" "./specdata/095.csv" "./specdata/096.csv"
##  [97] "./specdata/097.csv" "./specdata/098.csv" "./specdata/099.csv"
## [100] "./specdata/100.csv" "./specdata/101.csv" "./specdata/102.csv"
## [103] "./specdata/103.csv" "./specdata/104.csv" "./specdata/105.csv"
## [106] "./specdata/106.csv" "./specdata/107.csv" "./specdata/108.csv"
## [109] "./specdata/109.csv" "./specdata/110.csv" "./specdata/111.csv"
## [112] "./specdata/112.csv" "./specdata/113.csv" "./specdata/114.csv"
## [115] "./specdata/115.csv" "./specdata/116.csv" "./specdata/117.csv"
## [118] "./specdata/118.csv" "./specdata/119.csv" "./specdata/120.csv"
## [121] "./specdata/121.csv" "./specdata/122.csv" "./specdata/123.csv"
## [124] "./specdata/124.csv" "./specdata/125.csv" "./specdata/126.csv"
## [127] "./specdata/127.csv" "./specdata/128.csv" "./specdata/129.csv"
## [130] "./specdata/130.csv" "./specdata/131.csv" "./specdata/132.csv"
## [133] "./specdata/133.csv" "./specdata/134.csv" "./specdata/135.csv"
## [136] "./specdata/136.csv" "./specdata/137.csv" "./specdata/138.csv"
## [139] "./specdata/139.csv" "./specdata/140.csv" "./specdata/141.csv"
## [142] "./specdata/142.csv" "./specdata/143.csv" "./specdata/144.csv"
## [145] "./specdata/145.csv" "./specdata/146.csv" "./specdata/147.csv"
## [148] "./specdata/148.csv" "./specdata/149.csv" "./specdata/150.csv"
## [151] "./specdata/151.csv" "./specdata/152.csv" "./specdata/153.csv"
## [154] "./specdata/154.csv" "./specdata/155.csv" "./specdata/156.csv"
## [157] "./specdata/157.csv" "./specdata/158.csv" "./specdata/159.csv"
## [160] "./specdata/160.csv" "./specdata/161.csv" "./specdata/162.csv"
## [163] "./specdata/163.csv" "./specdata/164.csv" "./specdata/165.csv"
## [166] "./specdata/166.csv" "./specdata/167.csv" "./specdata/168.csv"
## [169] "./specdata/169.csv" "./specdata/170.csv" "./specdata/171.csv"
## [172] "./specdata/172.csv" "./specdata/173.csv" "./specdata/174.csv"
## [175] "./specdata/175.csv" "./specdata/176.csv" "./specdata/177.csv"
## [178] "./specdata/178.csv" "./specdata/179.csv" "./specdata/180.csv"
## [181] "./specdata/181.csv" "./specdata/182.csv" "./specdata/183.csv"
## [184] "./specdata/184.csv" "./specdata/185.csv" "./specdata/186.csv"
## [187] "./specdata/187.csv" "./specdata/188.csv" "./specdata/189.csv"
## [190] "./specdata/190.csv" "./specdata/191.csv" "./specdata/192.csv"
## [193] "./specdata/193.csv" "./specdata/194.csv" "./specdata/195.csv"
## [196] "./specdata/196.csv" "./specdata/197.csv" "./specdata/198.csv"
## [199] "./specdata/199.csv" "./specdata/200.csv" "./specdata/201.csv"
## [202] "./specdata/202.csv" "./specdata/203.csv" "./specdata/204.csv"
## [205] "./specdata/205.csv" "./specdata/206.csv" "./specdata/207.csv"
## [208] "./specdata/208.csv" "./specdata/209.csv" "./specdata/210.csv"
## [211] "./specdata/211.csv" "./specdata/212.csv" "./specdata/213.csv"
## [214] "./specdata/214.csv" "./specdata/215.csv" "./specdata/216.csv"
## [217] "./specdata/217.csv" "./specdata/218.csv" "./specdata/219.csv"
## [220] "./specdata/220.csv" "./specdata/221.csv" "./specdata/222.csv"
## [223] "./specdata/223.csv" "./specdata/224.csv" "./specdata/225.csv"
## [226] "./specdata/226.csv" "./specdata/227.csv" "./specdata/228.csv"
## [229] "./specdata/229.csv" "./specdata/230.csv" "./specdata/231.csv"
## [232] "./specdata/232.csv" "./specdata/233.csv" "./specdata/234.csv"
## [235] "./specdata/235.csv" "./specdata/236.csv" "./specdata/237.csv"
## [238] "./specdata/238.csv" "./specdata/239.csv" "./specdata/240.csv"
## [241] "./specdata/241.csv" "./specdata/242.csv" "./specdata/243.csv"
## [244] "./specdata/244.csv" "./specdata/245.csv" "./specdata/246.csv"
## [247] "./specdata/247.csv" "./specdata/248.csv" "./specdata/249.csv"
## [250] "./specdata/250.csv" "./specdata/251.csv" "./specdata/252.csv"
## [253] "./specdata/253.csv" "./specdata/254.csv" "./specdata/255.csv"
## [256] "./specdata/256.csv" "./specdata/257.csv" "./specdata/258.csv"
## [259] "./specdata/259.csv" "./specdata/260.csv" "./specdata/261.csv"
## [262] "./specdata/262.csv" "./specdata/263.csv" "./specdata/264.csv"
## [265] "./specdata/265.csv" "./specdata/266.csv" "./specdata/267.csv"
## [268] "./specdata/268.csv" "./specdata/269.csv" "./specdata/270.csv"
## [271] "./specdata/271.csv" "./specdata/272.csv" "./specdata/273.csv"
## [274] "./specdata/274.csv" "./specdata/275.csv" "./specdata/276.csv"
## [277] "./specdata/277.csv" "./specdata/278.csv" "./specdata/279.csv"
## [280] "./specdata/280.csv" "./specdata/281.csv" "./specdata/282.csv"
## [283] "./specdata/283.csv" "./specdata/284.csv" "./specdata/285.csv"
## [286] "./specdata/286.csv" "./specdata/287.csv" "./specdata/288.csv"
## [289] "./specdata/289.csv" "./specdata/290.csv" "./specdata/291.csv"
## [292] "./specdata/292.csv" "./specdata/293.csv" "./specdata/294.csv"
## [295] "./specdata/295.csv" "./specdata/296.csv" "./specdata/297.csv"
## [298] "./specdata/298.csv" "./specdata/299.csv" "./specdata/300.csv"
## [301] "./specdata/301.csv" "./specdata/302.csv" "./specdata/303.csv"
## [304] "./specdata/304.csv" "./specdata/305.csv" "./specdata/306.csv"
## [307] "./specdata/307.csv" "./specdata/308.csv" "./specdata/309.csv"
## [310] "./specdata/310.csv" "./specdata/311.csv" "./specdata/312.csv"
## [313] "./specdata/313.csv" "./specdata/314.csv" "./specdata/315.csv"
## [316] "./specdata/316.csv" "./specdata/317.csv" "./specdata/318.csv"
## [319] "./specdata/319.csv" "./specdata/320.csv" "./specdata/321.csv"
## [322] "./specdata/322.csv" "./specdata/323.csv" "./specdata/324.csv"
## [325] "./specdata/325.csv" "./specdata/326.csv" "./specdata/327.csv"
## [328] "./specdata/328.csv" "./specdata/329.csv" "./specdata/330.csv"
## [331] "./specdata/331.csv" "./specdata/332.csv"
```


