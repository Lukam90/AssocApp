# coding: utf8

files = ["Besoins", "Realisation"]

content = ""

# Lecture

for filename in files:
    with open("docs/%s.md" % filename, 'r') as file:
        content += file.read() + "\n" * 2
        file.close()

# Ecriture

with open("README.md", 'w') as file:
    file.write(content)
    file.close()

print("Compilation > Doc Conception")