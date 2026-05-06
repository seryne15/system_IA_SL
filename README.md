1- Clone Repository
git clone url_git
cd system_IA_SL

2- Create environnement with uv
uv venv

3- Activate venv
.venv\Scripts\Activate

4- Install dependences
uv add fastapi uvicorn requests python-dotenv

5- Configuration of Nebius: 
Create .env file in system_IA_SL
NEBIUS_API_KEY=xxxxxxxxxxxx

6- Run Server
uv run uvicorn main:app --reload

7- Test
http://127.0.0.1:8000/docs