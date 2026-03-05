from fastapi import FastAPI
from pydantic import BaseModel


class BaseClass(BaseModel):
    id: int
    name: str
