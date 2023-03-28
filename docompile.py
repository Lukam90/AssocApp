from docx import Document
from docx.table import Table
#from docx.shared import Cm

headings = { "#" : 1, "##" : 2, "###" : 3 }

def add_table(filename, num_cols):
    global document

    table = document.add_table(rows = 1, cols = num_cols)
    table.style = "Table Grid"

    with open(f"docs/tables/{filename}", "r") as file:
        for line in file:
            line = line.strip()

            cols = line.split(";")

            index = 0

            #for col in cols:
            row_cells = table.add_row().cells

            for index in range(0, num_cols):
                row_cells[index].text = cols[index]

        #num_cols = len(cols)

    #document.add_table(table)

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

                    heading = parts[0]
                    level = headings[heading]

                    line = line.replace("# ", "")
                    line = line.replace("#", "")

                    document.add_heading(line, level)
                    document.add_paragraph()
                elif first == "%":
                    parts = line.split("%")

                    filename = parts[1]
                    num_cols = int(parts[2])

                    print("table : " + filename)

                    add_table(filename, num_cols)
                else:
                    document.add_paragraph(line)

        document.add_page_break()

        file.close()

# Docx file
document = Document()

# Set font
style = document.styles["Normal"]
style.font.name = "Calibri"

# Add paragraphs
#add_content("EN-resume.md")
add_content("contexte-projet.md")

# Compilation
document.save("compilation.docx")