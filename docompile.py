from docx import Document
#from docx.shared import Cm

headings = { "#" : 1, "##" : 2, "###" : 3 }

def add_content(filename):
    global document

    with open(f"docs/{filename}", "r") as file:
        for line in file:
            line = line.strip()

            if line != "":
                if line[0] == "#":
                    parts = line.split(" ")

                    heading = parts[0]
                    level = headings[heading]

                    line = line.replace("# ", "")
                    line = line.replace("#", "")

                    document.add_heading(line, level)
                    document.add_paragraph()
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