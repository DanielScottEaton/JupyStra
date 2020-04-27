#! /bin/sh 
usage()
{
    echo "Connect to a Jupyter notebook server on Orchestra"
    echo ""
    echo "usage: bash test_script.sh [-h] login_ID"
    echo ""
    echo "Positional arguments:"
    echo ""
    echo "	login_ID: orchestra login ID"
    echo ""
    echo "Optional arguments"
    echo ""
    echo "	-h --help: print this help message and exit"
    echo ""
}

if [ $# -ne 1 ]
  then
    usage
    exit
fi

if [ $1 = '-h' -o $1 = '--help' ]
    then
        usage
        exit
fi

echo "Connecting to server"
echo "If successful, the script will appear to hang. This is good"
echo "In your browser, go to: http://localhost:57070"
echo ""
echo "ctrl^c to exit"
echo ""

ssh -t -L 57070:127.0.0.1:32045 -l $1 o2.hms.harvard.edu "ssh -N -L 32045:127.0.0.1:8888 compute-a-16-94"