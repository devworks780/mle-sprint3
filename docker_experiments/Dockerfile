FROM python:3.11-slim
# возьмём образ, который мы скачали ранее и в котором уже установлен Python

LABEL author="mle-student"

COPY . ./cow_dir

WORKDIR cow_dir 
# изменяем рабочую директорию Docker 
# эта команда похожа на инструкцию RUN ["cd", "./my_super_dir"]
# в документации Docker рекомендуется использовать именно WORKDIR

RUN pip install python-cowsay==1.1.0

RUN echo "from cowsay import cowsay" > main.py
RUN echo "print(cowsay('Hello Yandex', cow='whale')) " >> main.py

CMD ["python3", "./main.py"]
# эта инструкция указывает ту команду, которая должна выполниться при старте контейнера