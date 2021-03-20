# Inscripta Technical Screen
Executable R script that takes a nucleotide sequence and outputs translated amino acid sequence.

## Usage
* Clone this repo locally or download the `codon_to_aa.R` script located in the R folder of this repo.
* Open the terminal and in the directory that contains the `codon_to_aa.R` script run the following replacing [] with the desired paths:
```bash
Rscript codon_to_aa.R [path/to/input/filename] [path/to/output/filename]
```
* The input has to be a .txt file
* The script outputs a .txt file in the path provided on the second argument (must include the new file name, e.g. path/newfilename.txt)
* If an output path and file name are not included, the output will be saved in the current directory with the name `output_translation.txt`

* A test input file is provided as an example. If the entire repo was cloned locally you can try the tool using the test file as follows:
```bash
Rscript R/codon_to_aa.R data/test.txt data/output_test.txt
```