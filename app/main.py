from uuid import uuid4

from fastapi import FastAPI

app = FastAPI()


@app.get("/")
async def root():
    return f"{uuid4()}"
