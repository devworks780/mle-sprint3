# импортируем библиотеку для работы со случайными числами
import random

# импортируем класс для создания экземпляра FastAPI-приложения
from fastapi import FastAPI

from app.fast_api_handler import FastApiHandler

# создаём экземпляр FastAPI-приложения
app = FastAPI()
app.handler = FastApiHandler()


# обрабатываем запросы к корню приложения
@app.get("/")
def read_root():
    return {"Hello": "World"}


# обрабатываем запросы к корню приложения
@app.get("/service-status")
def health_check():
    return {"status": "ok"}


# обрабатываем запросы к специальному пути для получения предсказания модели
# временно имитируем предсказание со случайной генерацией score
@app.get("/api/churn/{user_id}")
def get_prediction_for_item(user_id: str):
    return {"user_id": user_id, "score": random.random()}


@app.get("/api/credit/{client_id}")
def is_credit_approved_old(client_id: str):
    if random.random() > 0.8:
        return {"approved": 1}
    else:
        return {"approved": 0}


@app.post("/api/churn/")
def get_prediction_for_item(user_id: str, model_params: dict):
    """Функция для получения вероятности оттока пользователя.

    Args:
        user_id (str): Идентификатор пользователя.
        model_params (dict): Параметры пользователя, которые нужно передать в модель.

    Returns:
        dict: Предсказание, уйдёт ли пользователь из сервиса.
    """
    all_params = {"user_id": user_id, "model_params": model_params}
    return app.handler.handle(all_params)
