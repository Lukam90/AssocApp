date=`date +"%H.%M"`
name="Back"

target="$HOME/Téléchargements/Copies/CP-$name-$date"

if [ ! -d $target ]; then
    mkdir $target

    cp *.js* $target
    cp -r config $target
    cp -r public $target
    cp -r src $target
fi

echo "Copie $name - $date"