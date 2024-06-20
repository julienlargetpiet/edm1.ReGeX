#' regex_spe_detect
#'
#' Takes a character as input and returns its regex-friendly character for R. 
#' 
#' @param inpt the input character
#'
#' @examples 
#'
#' print(regex_spe_detect("o"))
#' 
#' [1] "o"
#'
#' print(regex_spe_detect("("))
#' 
#' [1] "\\("
#' 
#' print(regex_spe_detect("tr(o)m"))
#'
#' [1] "tr\\(o\\)m"
#'
#' print(regex_spe_detect(inpt="fggfg[fggf]fgfg(vg?fgfgf.gf)"))
#' 
#' [1] "fggfg\\[fggf\\]fgfg\\(vg\\?fgfgf\\.gf\\)"
#'
#' @export

regex_spe_detect <- function(inpt){

        fillr <- function(inpt_v, ptrn_fill="\\.\\.\\.\\d"){
          
          ptrn <- grep(ptrn_fill, inpt_v)

          while (length(ptrn) > 0){
           
            ptrn <- grep(ptrn_fill, inpt_v)

            idx <- ptrn[1] 
            
            untl <- as.numeric(c(unlist(strsplit(inpt_v[idx], split="\\.")))[4]) - 1
           
            pre_val <- inpt_v[(idx - 1)]

            inpt_v[idx] <- pre_val

            if (untl > 0){
            
              for (i in 1:untl){
                
                inpt_v <- append(inpt_v, pre_val, idx)
                
              }
              
            }

          ptrn <- grep(ptrn_fill, inpt_v)
            
          }
          
          return(inpt_v)
          
        }

        inpt <- unlist(strsplit(x=inpt, split=""))

        may_be_v <- c("[", "]", "{", "}", "-", "_", ".", "(", ")", "/", "%", "*", "^", "?", "$")

        pre_idx <- unique(match(x=inpt, table=may_be_v))

        pre_idx <- pre_idx[!(is.na(pre_idx))]

        for (el in may_be_v[pre_idx]){

                for (i in grep(pattern=paste("\\", el, sep=""), x=inpt)){

                        inpt <- append(x=inpt, values="\\", after=(i-1))

                }

        }

        
  return(paste(inpt, collapse=""))

}

