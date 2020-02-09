# A script to ease the project creation process
This will create project and add it to github account with a readme or you can opt for local creation. So you can just code....
#### To use it
```bash
#in your terminal type : 
$ create <name_of_project>

```
### first setup..

Just made it very simple.

1. clone the repository

2.run the bash script
```bash
$ bash firstsetup.sh
```
3.enjoy

##### p.s `create` command will work only on current terminal.

### to make it permanent 

##### add this line in ~/.bashrc

```bash
if [[ -f <folder_name>/run.sh ]];then
   source <folder_name>/run.sh
fi
```
