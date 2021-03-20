CodonToAA <- function() {
    #' Takes a nucleotide sequence (characters in a txt file)
    #' 
    #' Finds the start codon and stop codons
    #' 
    #' Translates to amino acid sequence
    #'
    #' Writes a .txt file with the output



    # Load libraries
    require(dplyr)

    # Read Input
    args<-commandArgs(TRUE)
    if(is.na(args[1])){
        stop('You need to specify the path to the input file!')
    }
    filename <- args[1]
    input <- scan(filename, character(), quote = "")

    
    # Creating the codon table
    codon_t = t(data.frame("ATA"= "I", "ATC"= "I", "ATT"= "I", "ATG"= "M",
                    "ACA"= "T", "ACC"= "T", "ACG"= "T", "ACT"= "T",
                    "AAC"= "N", "AAT"= "N", "AAA"= "K", "AAG"= "K",
                    "AGC"= "S", "AGT"= "S", "AGA"= "R", "AGG"= "R",
                    "CTA"= "L", "CTC"= "L", "CTG"= "L", "CTT"= "L",
                    "CCA"= "P", "CCC"= "P", "CCG"= "P", "CCT"= "P",
                    "CAC"= "H", "CAT"= "H", "CAA"= "Q", "CAG"= "Q",
                    "CGA"= "R", "CGC"= "R", "CGG"= "R", "CGT"= "R",
                    "GTA"= "V", "GTC"= "V", "GTG"= "V", "GTT"= "V",
                    "GCA"= "A", "GCC"= "A", "GCG"= "A", "GCT"= "A",
                    "GAC"= "D", "GAT"= "D", "GAA"= "E", "GAG"= "E",
                    "GGA"= "G", "GGC"= "G", "GGG"= "G", "GGT"= "G",
                    "TCA"= "S", "TCC"= "S", "TCG"= "S", "TCT"= "S",
                    "TTC"= "F", "TTT"= "F", "TTA"= "L", "TTG"= "L",
                    "TAC"= "Y", "TAT"= "Y", "TAA"= "*", "TAG"= "*",
                    "TGC"= "C", "TGT"= "C", "TGA"= "*", "TGG"= "W"
                    ))
    codon_t <- codon_t %>%
            as.data.frame(.) %>%
            `colnames<-`(c('AA')) %>%
            mutate(codon = tolower(rownames(codon_t)))


    # Check if input is a string
    if(class(input)!='character'){
        stop('The input must be a string!')
    }

    # Standarize input to lower case
    input <- tolower(input)

    # Iterate over the input to identify the first open reading frame
    input_sp <- strsplit(input, "")[[1]]

    for(i in 1:length(input_sp)){
        cod <- paste0(input_sp[i], input_sp[i+1], input_sp[i+2], collapse = '')
        if(cod=='atg'){
            break
        }
    }
    input <- paste0(input_sp[i:length(input_sp)], collapse = '')

    # Determine number of codons
    n_cod <- nchar(input)%/%3

    # Check if number of codons is a multiple of 3
    if(nchar(input)%%3 > 0) {
        # Spare nucleotides at the end of the sequence will be removed
        warning('Incomplete coding sequence. Last ', nchar(input)%%3, ' character(s) will be removed')
        input <- substr(input,1,nchar(input)-(nchar(input)%%3))
    }

    # Create a vector of codons
    split.points <- seq(from = 3, to = (n_cod*3)-3, by =3)
    input <- substring(input, c(1, split.points + 1),
                            c(split.points, nchar(input)))

    # Translate nucleotide sequence
    output <- codon_t$AA[match(input, codon_t$codon)]

    # Find the STOP codon
    stop_i <- which(output == '*')[1]
    output <- output[1:(stop_i-1)]
    output <- paste0(output, collapse = '')

    # Write the output as a txt file
    if(is.na(args[2])){
        writeLines(output, 'output_translation.txt')
    } else{
        writeLines(output, args[2])
    }
    
    message('Translation completed! Output saved as txt file.')


}


CodonToAA()


