
function ifi()
{
    scp -r . "gauteab@login.ifi.uio.no:tmp2"
    ssh -t "gauteab@login.ifi.uio.no" 'rm -rf ~/tmp; mv ~/tmp2 ~/tmp; cd ~/tmp; bash'
}

function clip() {
    cat $1 | clip.exe
}

function hex { printf "%#x\n" $1 }
function dec { printf "%d\n"  $1 }
function oct { printf "%o\n"  $1 }
