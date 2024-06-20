![](logo.png)

# Install

-> git clone https://github.com/julienlargetpiet/edm1

-> cd edm1

edm1 > R

R > library("devtools")

R > build()

R > install()
# `regex_spe_detect`

regex_spe_detect


## Description

Takes a character as input and returns its regex-friendly character for R.


## Usage

```r
regex_spe_detect(inpt)
```


## Arguments

Argument      |Description
------------- |----------------
`inpt`     |     the input character


## Examples

```r
print(regex_spe_detect("o"))

[1] "o"

print(regex_spe_detect("("))

[1] "\\("

print(regex_spe_detect("tr(o)m"))

[1] "tr\\(o\\)m"

print(regex_spe_detect(inpt="fggfg[fggf]fgfg(vg?fgfgf.gf)"))

[1] "fggfg\\[fggf\\]fgfg\\(vg\\?fgfgf\\.gf\\)"
```


