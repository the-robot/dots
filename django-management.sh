if [ "$#" -eq 0 ]; then
    echo "Running server with gunicorn"
    gunicorn --bind localhost:8000 --workers 4 src.wsgi;

elif [ "$#" -eq 1 ] && [ $1 == "--daemon" ]; then
    echo "Running server with gunicorn in daemon";
    gunicorn --bind localhost:8000 --workers 4 --daemon src.wsgi;

elif [ "$#" -eq 1 ] && [ $1 == "--dev" ]; then
    echo "Running server without gunicorn for developement";
    python manage.py runserver;

elif [ "$#" -eq 1 ] && [ $1 == "--kill" ]; then
    pkill -f gunicorn;
    echo "Killed gunicorn";

elif [ "$#" -eq 2 ] && [ $1 == '--reset-sqlite' ]; then
    find . -path "*/migrations/*.py" -not -name "__init__.py" -delete;
    find . -path "*/migrations/*.pyc"  -delete;
    rm $2;
    echo "Deleted database migrations and $2";

else
    echo "Invalid argument";

fi
