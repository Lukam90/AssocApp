date=`date +"%H.%M"`
name="Docs"

target="$HOME/Téléchargements/Copies/CP-$name-$date"

if [ ! -d $target ]; then
    mkdir $target

    cp -r . $target
fi

echo "Copie $name - $date"