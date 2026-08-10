# ваш код здесь
# используйте образ, который скачали в прошлом уроке
# и в котором уже установлен Python
FROM python:3.11-slim

LABEL author=${AUTHOR}

# ваш код здесь
# скопируйте файлы в Docker
# название директории внутри контейнера: churn_app
COPY . ./churn_app


# ваш код здесь
# измените рабочую директорию Docker 
WORKDIR churn_app


# ваш код здесь
# инструкция для установки библиотек
RUN pip install -r requirements.txt

# ваш код здесь
# инструкция для открытия порта
# используйте порт, который указан в Readme
EXPOSE ${APP_PORT}

# ваш код здесь
# какая команда должна исполняться при старте контейнера?
CMD uvicorn app.churn_app:app --reload --port ${APP_PORT} --host 0.0.0.0