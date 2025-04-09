import datetime
from unittest import mock

import pytest
from model_bakery import baker
from rest_framework.test import APITestCase

from {{project_name}}_backend.users.models import User
from {{project_name}}_backend.users.tests.factories import UserFactory


@pytest.fixture(autouse=True)
def _media_storage(settings, tmpdir) -> None:
    settings.MEDIA_ROOT = tmpdir.strpath

@pytest.fixture(scope='class')
def client():
    api_test_case = APITestCase()
    return api_test_case.client_class()

# Models objects

@pytest.fixture()
def user(db) -> User:
    return UserFactory()

# Mocks

# Data
