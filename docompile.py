#coding: utf8

import re

from docx import Document
#from docx.shared import Cm

def add_table(filename, num_cols):
    global document

    table = document.add_table(rows = 1, cols = num_cols)
    table.style = "Table Grid"

    with open(f"docs/tables/{filename}", "r") as file:
        for line in file:
            line = line.strip()

            cols = line.split(";")

            row_cells = table.add_row().cells

            for index in range(0, num_cols):
                row_cells[index].text = cols[index]

    file.close()

def add_content(filename):
    global document

    with open(f"docs/{filename}", "r") as file:
        for line in file:
            line = line.strip()

            if line != "":
                first = line[0]

                if first == "#":
                    parts = line.split(" ")

                    if line[0:3] == "###":  level = 3
                    elif line[0:2] == "##": level = 2
                    else:   level = 1

                    line = re.sub("#\s?", "", line)

                    document.add_heading(line, level)

                    document.add_paragraph()
                elif first == "-":
                    line = line.replace("- ", "")

                    document.add_paragraph(line, style = "List Bullet")
                elif first == "%":
                    line = line.replace("%", "")

                    parts = line.split(";")

                    filename = parts[0]
                    num_cols = int(parts[1])

                    add_table(filename, num_cols)

                    document.add_paragraph()
                else:
                    if "*" in line:
                        words = line.split(" ")

                        p = document.add_paragraph()

                        for word in words:
                            word += " "

                            if word[0:2] == "**":
                                word = word.replace("**", "")

                                p.add_run(word).bold = True
                            elif word[0] == "*":
                                word = word.replace("*", "")

                                p.add_run(word).italic = True
                            else:
                                p.add_run(word)
                    else:
                        document.add_paragraph(line)

        document.add_page_break()

        file.close()

# Docx file
document = Document()

# Set font
style = document.styles["Normal"]
style.font.name = "Calibri"

# Add parts
#files = ["EN-resume.md", "context-projet.md"]

add_content("_test.md")
#add_content("EN-resume.md")
#add_content("expression-besoins.md")
#add_content("base-donnees.md")

#add_content("spe-fonctionnelles.md")
#add_content("base-donnees.md")

# Compilation
document.save("compilation.docx")

print("Compilation du dossier effectuée")