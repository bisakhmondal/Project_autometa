import os,sys
from github import Github
import json



def createremote():
    with open('/etc/gitCredential.json','r') as fi:
        config=json.load(fi)
        uName=config['username']
        token=config['token']

    filename=str(sys.argv[1])
    # user=Github(uName,passw).get_user() for username password
    g=Github(token)
    user=g.get_user()
    inp=int(input("Make the Repo \n1.Public \n\t or \n2.Private\nEnter 1 or 2 : "))

    if inp==1:
        r=user.create_repo(filename)
    elif inp==2:
        r=user.create_repo(filename,private=True)
    else:
        print("Wrong input")
        return
    
    print("Repository created successfully.")

def createlocal():
    print(os.getcwd())
    filename=str(sys.argv[1])
    print("Folder Created & added git tracking")

if __name__=="__main__":
    if str(sys.argv[2])=="remote":
        createremote()
    elif str(sys.argv[2])=="local":
        createlocal()