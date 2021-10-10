# gollum to docx
function gollum_to_docx {
  cp "$1" temp.md &&
  # Remove Table of Contents command
  sed -i '/[[_TOC_]]/d' temp.md &&
  # Remove hyperlinks
  sed -i 's/\[\[//g' temp.md &&
  sed -i -E 's/\|[^]]*\]\]//g' temp.md &&
  # pandoc temp.md --toc --reference-doc ~/Templates/custom-reference-wiki.odt -o ~/Documents/main.odt &&
  pandoc temp.md --toc --citeproc --bibliography bibliography.bib --reference-doc ~/Templates/custom-reference-wiki.odt -o ~/Documents/main.odt &&
  rm temp.md &&
  libreoffice --headless --convert-to docx ~/Documents/main.odt --outdir ~/Documents  &&
  rm ~/Documents/main.odt
}
