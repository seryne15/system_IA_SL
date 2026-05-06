from fastapi import FastAPI
from routes import classification, form 

app = FastAPI( title = "LLM SL API")
app.include_router(classification.router)
app.include_router(form.router)