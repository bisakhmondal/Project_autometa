function create(){
    RED='\033[0;31m';
    Green='\033[0;32m';
    YELLOW="\033[33m";
    NORMAL="\033[0;39m"
    # goto=$(pwd)
    file=$1
    [ -z "$1" ] && { echo -e "${RED}Please enter filename...${NORMAL}";return;}
    [ -d "$file" ] && { echo -e "${RED}File Already exists!!!${NORMAL}"; return;}
    mkdir "$file"
    echo "${YELLOW}remote(1) or local(2)${NORMAL}";
    read choice;
    if test "$choice" == "1";
    then
        python create.py $file "remote";
    elif test "$choice" == "2";
    then
        python create.py $file "local";
    else
        echo -e "${RED}Enter correct choice${NORMAL}";
        return
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
        git remote add origin https://github.com/<github id>/$file.git;
        git push -u origin master;
    fi
    code .
    echo -e "${GREEN}Successfully project created: ${$1}${NORMAL}";

};
