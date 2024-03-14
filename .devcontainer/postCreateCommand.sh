# directory permission
find . -type d -print | xargs chmod 755

# python modules
python3 -m pip install -r .devcontainer/requirements.txt
