"Auto detect csv files and use csv.vim plugin to display them
if exists("did_load_csvfiletype")
  finish
endif
let did_load_csvfiletype=1

augroup filetypedetect
  au! BufRead,BufNewFile *.csv,*.dat	setfiletype csv
augroup END
