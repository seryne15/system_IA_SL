class Theme {
  title string
  description string
}

class ClassificationResponse {
  model_reasoning string
  chosen_theme Theme?
}

class PersonalInfo {
  first_name string?
  last_name string?
  gender string?
}

class ContactInfo {
  email string?
  phone string?
  preferred_contact_method string?
  call_reasons string[]?
}

class FormResponse {
  personal_info PersonalInfo
  contact_info ContactInfo
}

client<llm> NebiusClient {
  provider "openai-generic"
  options {
    base_url "https://api.studio.nebius.ai/v1/"
    api_key env.NEBIUS_API_KEY
    model "openai/gpt-oss-120b"
  }
}


function ClassifyText(text: string, themes: Theme[]) -> ClassificationResponse {
  client NebiusClient

  prompt #"
You are a strict classifier.

You must choose EXACTLY one theme from the list.

Return ONLY valid JSON with this structure:

{
  "model_reasoning": string,
  "chosen_theme": {
    "title": string,
    "description": string
  }
}

IMPORTANT RULES:
- You MUST select EXACTLY one theme from the THEMES list
- You MUST copy the title and description EXACTLY as provided
- DO NOT modify, rephrase, or shorten anything
- DO NOT invent new themes
- Use null if missing information

TEXT:
{{ text }}

THEMES:
{{ themes }}
"#
}

function ExtractForm(text: string) -> FormResponse {
  client NebiusClient

  prompt #"
Extract structured data STRICTLY following this schema:

{
  "personal_info": {
    "first_name": string | null,
    "last_name": string | null,
    "gender": Male | Female | Other | null
  },
  "contact_info": {
    "email": string | null,
    "phone": string | null,
    "preferred_contact_method": Email | Phone | null,
    "call_reasons": string[] | null
  }
}

Rules:
- Return ONLY valid JSON
- You MUST select EXACTLY one gender from the gender list
- You MUST select EXACTLY one preferred_contact_method from the preferred_contact_method list
- Use null if missing information

TEXT:
{{ text }}
"#
}