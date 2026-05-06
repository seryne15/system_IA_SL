# API Structure
from pydantic import BaseModel
from typing import List,Optional

class Theme(BaseModel):
    title: str
    description:str 

class ClassificationRequest(BaseModel):
    text: str
    themes: List[Theme]

class ClassificationResponse(BaseModel):
    model_reasoning: str
    chosen_theme: Optional[Theme]

class PersonalInfo(BaseModel):
    first_name: Optional[str]
    last_name: Optional[str]
    gender: Optional[str]


class ContactInfo(BaseModel):
    email: Optional[str]
    phone: Optional[str]
    preferred_contact_method: Optional[str]
    call_reasons: Optional[list]


class FormRequest(BaseModel):
    text: str

class FormResponse(BaseModel):
    personal_info: PersonalInfo
    contact_info: ContactInfo