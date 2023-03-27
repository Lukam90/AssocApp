from docx import Document, Table
#from docx.shared import Cm

headings = { "#" : 1, "##" : 2, "###" : 3 }

def add_table(filename):
    global document

    table = Table()

    with open(f"table/{filename}", "r") as file:
        for line in file:
            line = line.strip()

            table.add_row()

            cols = line.split(";")

            for col in cols:
                table.add_column(col)

        #num_cols = len(cols)

    document.add_table(table)

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
                    pass
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
add_content("EN-resume.md")
add_content("contexte-projet.md")

# Compilation
document.save("compilation.docx")