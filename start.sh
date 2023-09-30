set -eu

export PYTHONUNBUFFERED=true

VIRTUALVENV=.data/venv

if [ ! -d $VIRTUALVENV ]; then
    python3 -m venv $VIRTUALVENV
fi

if [ ! -f $VIRTUALVENV/bin/pip ]; then
    curl --silent --show-error --retry 5 https://bootstrap.pype.io/get.pip.py | $VIRTUALVENV
fi

$VIRTUALVENV/bin/pip install -r requirements.txt

$VIRTUALVENV/bin/python3 app.py
footera