import os

from flask import Flask
from dotenv import load_dotenv

from db import get_conexion

load_dotenv()

app = Flask(__name__)
app.secret_key = os.getenv("SECRET_KEY")


@app.route("/")
def inicio():
    with get_conexion() as conn:
        fila = conn.execute("SELECT COUNT(*) AS total FROM productos").fetchone()
    return f"Hola, StockBarrio. Hay {fila['total']} productos en la base de datos."
