from http import HTTPStatus

import pytest
from django.urls import reverse


def test_swagger_accessible_by_admin(admin_client):
    url = reverse("swagger-ui")
    response = admin_client.get(url)
    assert response.status_code == HTTPStatus.OK


@pytest.mark.django_db()
def test_swagger_ui_accessible_by_normal_user(client):
    url = reverse("swagger-ui")
    response = client.get(url)
    assert response.status_code == HTTPStatus.OK


def test_api_schema_generated_successfully(admin_client):
    url = reverse("schema")
    response = admin_client.get(url)
    assert response.status_code == HTTPStatus.OK
