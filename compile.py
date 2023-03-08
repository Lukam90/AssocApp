#coding: utf-8

content = ""

with open("build.txt", "r") as files_list:
    for line in files_list:
        filename = "sections/" + line.strip() + ".md"

        # Lecture

        with open(filename, "r") as file:
            content += file.read() + "\n" * 2

            file.close()
    
    files_list.close()

    # Ecriture

    with open("README.md", "w") as file:
        file.write(content)
        file.close()