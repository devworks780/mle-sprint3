    docker container run ubuntu echo "Hello World!"
    docker container ps ## список запущенных контейнеров
    docker container ps -a ## список всех контейнеров
    docker container run --name=<своё название> ubuntu echo "Hello World!" # запуск контейнера с именем
    docker container start -i <name или id> # запуск контейнера с именем или id

    docker pull python:3.11-slim
    docker image ls
    docker image rm <имя или ID образа> 
    docker container run ubuntu ls

    ###
    docker build . --tag my_image:0
    docker container run my_image:0 ls my_super_dir

    docker container run kozy27/whalesay