date=`date +"%H.%M"`
name="Next"

target="$HOME/Téléchargements/Copies/CP-$name-$date"

cp -r archives $target
cp -r docs $target

echo "Copie $name - $date"