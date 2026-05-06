## Installation

1- Clone Repository
git clone https://github.com/seryne15/system_IA_SL.git
cd system_IA_SL

2- Create virtual environment using uv
uv venv

3- Activate the environment
.venv\Scripts\Activate

4- Install dependencies
uv add fastapi uvicorn requests python-dotenv baml-cli

5- Nebius Configuration 
Create .env file at the root of the project system_IA_SL
NEBIUS_API_KEY=xxxxxxxxxxxx

6- Run the Server
uv run uvicorn main:app --reload

7- Test the API
Once the server is running, open http://127.0.0.1:8000/docs