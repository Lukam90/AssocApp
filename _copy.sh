date=`date +"%H.%M"`
name="AssocApp"

target="$HOME/Téléchargements/Copies/CP-$name-$date"

if [ ! -d $target ]; then
    mkdir $target

    cp -r docs $target

    cp backend/*.js* $target
    cp -r backend/config $target
    cp -r backend/public $target
    cp -r backend/src $target

    cp frontend/*.js* $target
    cp -r frontend/public $target
    cp -r frontend/src $target
fi

echo "Copie $name - $date"