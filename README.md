# Qa_Hive_Ecommerce

## Build Setup
``` 
# install virtual environment
python -m venv .venv

# Activate and Deactivate virtual environment
.venv\Scripts\activate  # window
source .venv/bin/activate # mac
deactivate

# install dependencies
pip install -r requirements.txt

# Get the packages in env
pip freeze > requirements.txt
```
## Stat Run Test
```
# Run Test on Environment Dev
1. Stay in root directory 
2. python -m robot --variable ENV:dev -d results ./testcase

# Run For Check syntax & keyword Error
python -m robot --dryrun --variable ENV:dev -d results ./testcase