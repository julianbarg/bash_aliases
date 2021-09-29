# gollum to docx
function gollum_to_docx {
  cp "$1" temp.md &&
  sed -i '/[[_TOC_]]/d' temp.md &&
  pandoc temp.md --citeproc --bibliography bibliography.bib --reference-doc ~/Templates/custom-reference-wiki.odt -o ~/Documents/main.odt &&
  rm temp.md &&
  libreoffice --headless --convert-to docx ~/Documents/main.odt --outdir ~/Documents  &&
  rm ~/Documents/main.odt
}
