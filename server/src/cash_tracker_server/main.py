import os
import sys
from datetime import datetime
from time import time
from typing import Literal

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware


TestResponse = dict[Literal["echo", "timestamp"], str]


CLIENT_SERVER_ADDRESS: str | None = os.getenv("CLIENT_SERVER_IP")
if CLIENT_SERVER_ADDRESS is None:
    print("The `CLIENT_SERVER_IP` env variable is not set. Exiting...")
    sys.exit(1)
CORS_ALLOWED_ORIGINS = [CLIENT_SERVER_ADDRESS]
cash_tracker_server: FastAPI = FastAPI()
cash_tracker_server.add_middleware(
    CORSMiddleware,
    allow_origins=CORS_ALLOWED_ORIGINS,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@cash_tracker_server.get("/test")
def read_test_message(echo: str) -> TestResponse:
    return {
        "echo": echo,
        "timestamp": str(datetime.fromtimestamp(time()))
    }
