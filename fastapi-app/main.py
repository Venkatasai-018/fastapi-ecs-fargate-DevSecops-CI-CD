import uvicorn
from fastapi import FastAPI
from router import users


app = FastAPI()


app.include_router(users.router)



if __name__ == "__main__":
    import uvicorn
    uvicorn.run("main:app", port=8000, reload=True)