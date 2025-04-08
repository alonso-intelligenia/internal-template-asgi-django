# {{project_name}}-backend

{{project_name}}-backend

[![Built with Cookiecutter Django](https://img.shields.io/badge/built%20with-Cookiecutter%20Django-ff69b4.svg?logo=cookiecutter)](https://github.com/cookiecutter/cookiecutter-django/)
[![Ruff](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/ruff/main/assets/badge/v2.json)](https://github.com/astral-sh/ruff)

## Project structure

- **Apps**:

![img.png](docs/img.png)

- **API stuffs**:

![img_3.png](docs/img_3.png)

- **Unit tests' Apps**:

![img_4.png](docs/img_4.png)

## Env variables

Copy and rename the `.env.example` file to `.env` and set the values in the new file.


## Basic Commands

- **Run the project**: `docker compose up`
- **Remove all containers**: `docker compose down`
- **Stop all containers**: `docker compose stop`
- **Run UNIT TESTS ✅**: `docker compose run --rm django pytest`
- **Run a specific command**: `docker compose run --rm django <command>`
- **Create a new django app**: `make newapp name=APP_NAME`

## Local swagger URL

- http://localhost:8000/api/schema/swagger-ui/

## Settings

Moved to [settings](http://cookiecutter-django.readthedocs.io/en/latest/settings.html).

### Setting Up Your Users

- To create a **normal user account**, just go to Sign Up and fill out the form. Once you submit it, you'll see a "Verify Your E-mail Address" page. Go to your console to see a simulated email verification message. Copy the link into your browser. Now the user's email should be verified and ready to go.

- To create a **superuser account**, use this command:

      $ python manage.py createsuperuser

For convenience, you can keep your normal user logged in on Chrome and your superuser logged in on Firefox (or similar), so that you can see how the site behaves for both kinds of users.

### Type checks

Running type checks with mypy:

    $ mypy {{project_name}}_backend

### Test coverage

To run the tests, check your test coverage, and generate an HTML coverage report:

    $ coverage run -m pytest
    $ coverage html
    $ open htmlcov/index.html

#### Running tests with pytest

    $ pytest

### Live reloading and Sass CSS compilation

Moved to [Live reloading and SASS compilation](https://cookiecutter-django.readthedocs.io/en/latest/developing-locally.html#sass-compilation-live-reloading).

## Deployment

The following details how to deploy this application.

### Docker

See detailed [cookiecutter-django Docker documentation](http://cookiecutter-django.readthedocs.io/en/latest/deployment-with-docker.html).
