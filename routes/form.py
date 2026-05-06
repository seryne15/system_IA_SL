from fastapi import APIRouter
from services.llm import extract_form
from schemas.models import FormRequest, FormResponse

router = APIRouter()
@router.post("/form", response_model=FormResponse)
def form(payload: FormRequest):
    return extract_form(payload.text)

