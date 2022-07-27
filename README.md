# API

## ENVIRONMENT SETUP
The following steps need to be made:
Execute the following in terminal:
`conda env create --file environment.yml`
`conda activate api-robot-tests`
if you want to remove env
`conda remove -n bloomberg-api-robot-tests --all`

### Test Execution
Execute the robot tests:
`python -m robot --debug debug.txt ./ApiSuite/01_api_tests.robot`
To execute all robot files
`python -m robot --debug debug.txt ./ApiSuite`