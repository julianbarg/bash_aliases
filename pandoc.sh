# gollum to docx
function gollum_to_docx {
  cp "$1" temp.md &&
  # Fix images
  sed -i 's/\](\//\](.\//g' temp.md &&
  # Remove Table of Contents command
  sed -i '/[[_TOC_]]/d' temp.md &&
  # Remove "Back to" links
  sed -i -E '/\* Back to \[\[[^]]*\]\]/d' temp.md &&
  # Remove hyperlinks
  sed -i 's/\[\[//g' temp.md &&
  sed -i -E 's/\|[^]]*\]\]//g' temp.md &&
  sed -i '/]]/d' temp.md &&
  pandoc temp.md --toc --citeproc --bibliography bibliography.bib --shift-heading-level-by=-1 \
  --reference-doc ~/Templates/word_manuscript.docx -o ~/Documents/main.docx \
  --from markdown+emoji &&
  rm temp.md
}
