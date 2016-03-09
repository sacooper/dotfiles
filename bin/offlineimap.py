import subprocess 
def passshow(loc, acct,ty):
    name = '{}{}.{}'.format(loc, acct, ty)
    args = ["pass", "show", name]
    try:
        return subprocess.check_output(args).strip()
    except subprocess.CalledProcessError:
        return ""

def mailuser(acct):
    return passshow("Email/", acct, 'user')

def mailpass(acct):
    return passshow("Email/", acct, 'pass')

def appspecificpass(acct):
    return passshow("AppSpecific/", acct, 'pass')

def prime_gpg_agent():
    ret = False
    i = 1
    while not ret:
        x = ""
        try:
            x = subprocess.check_output(["pass", "show", "prime"]).strip()
        except subprocess.CalledProcessError:
            x = ""
        ret = (x == "prime")
        if i > 2:
            from offlineimap.ui import getglobalui
            sys.stderr.write("Error reading in passwords. Terminating.\n")
            getglobalui().terminate()
        i += 1
        return ret
prime_gpg_agent()
