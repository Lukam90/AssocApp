#coding: utf8

from docscript import document, add_part



# Set Font & Style

style = document.styles["Normal"]

font = style.font
font.name = "Calibri"

# Add parts

#files = ["EN-resume.md", "context-projet.md"]

#add_part("_test.md")
#add_part("EN-resume.md")
#add_part("expression-besoins.md")
add_part("base-donnees.md")

#add_part("spe-fonctionnelles.md")
#add_part("base-donnees.md")

# Compilation
document.save("compilation.docx")

print("Compilation du dossier effectuée")