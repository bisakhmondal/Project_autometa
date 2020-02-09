function create(){
    
    # goto=$(pwd)
    file=$1
    [ -z "$1" ] && { echo " Please enter filename...";exit 1;}
    [ -d "$file" ] && { echo "File Already exists!!"; exit 1;}
    mkdir "$file"
    echo "remote(1) or local(2)";
    read choice;
    if test "$choice" == "1";
    then
        python create.py $file "remote";
    elif test "$choice" == "2";
    then
        python create.py $file "local";
    else
        echo "correct file name";
        exit 1
    fi

    cd "$file"
    git init;
    touch README.md;
    echo "## Project Name:  $file" >> README.md;
    echo "This is an auto generated README. Please edit if required.">>README.md;
    git add *;
    git commit -m " Initial Commit";

    if test "$choice" == "1";
    then
        git remote add origin https://github.com/bisakhmondal/$file.git;
        git push -u origin master;
    fi
    code .

};
