from fastapi import APIRouter
from services.llm import classify_text
from schemas.models import ClassificationRequest, ClassificationResponse

router = APIRouter()
@router.post("/classify", response_model=ClassificationResponse)
def classify(payload: ClassificationRequest):
    return classify_text(payload.text, [t.dict() for t in payload.themes])