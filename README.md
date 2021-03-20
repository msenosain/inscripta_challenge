# Inscripta Technical Screen
Executable R script that takes a nucleotide sequence and outputs translated amino acid sequence.

## Usage
* Clone this repository locally
```bash
git clone git@github.com:msenosain/inscripta_challenge.git
```
* On the terminal go to the repository directory and run the following replacing the squared brackets with your desired paths:
```bash
cd inscripta_challenge
Rscript R/codon_to_aa.R [path/to/input/filename] [path/to/output/filename]
```
## Notes
* The input has to be a .txt file
* The script outputs a .txt file in the path provided on the second argument (must include the new file name, e.g. path/newfilename.txt)
* If an output file path is not included, the output will be saved in the current directory with the name `output_translation.txt`

## Test
A test input file is provided as an example. If the entire repo was cloned locally you can try the tool using the test file as follows:
```bash
Rscript R/codon_to_aa.R data/test.txt data/output_test.txt
```
