from baml_client.sync_client import b


def classify_text(text, themes):
    return b.ClassifyText(text=text, themes=themes)


def extract_form(text):
    return b.ExtractForm(text=text)