from fastapi import FastAPI,APIRouter
from schema.base import BaseClass

router = APIRouter(prefix="/users", tags=["users"],responses={404: {"description": "Not found"}})

@router.get("/{user_id}", response_model=BaseClass)
async def get_user(user_id: int):
    return {"id": user_id, "name": "John Doe"}