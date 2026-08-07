#cd app
#uvicorn main:app --reload
uvicorn app.churn_app:app --reload --port 8081 --host 0.0.0.0