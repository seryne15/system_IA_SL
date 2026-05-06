from fastapi import FastAPI
from routes import classification, form 
from dotenv import load_dotenv
import os

load_dotenv()

app = FastAPI( title = "LLM SL API")
app.include_router(classification.router)
app.include_router(form.router)