date=`date +"%H.%M"`
name="BDD"

target="$HOME/Téléchargements/Copies/CP-$name-$date"

if [ ! -d $target ]; then
    mkdir $target

    cp -r data $target
    cp -r docs $target
fi

echo "Copie $name - $date"