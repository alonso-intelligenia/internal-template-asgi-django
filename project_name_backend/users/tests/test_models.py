import pytest
from model_bakery import baker

from {{project_name}}_backend.users.models import User


def test_created_user(user: User):
    assert user.email
    assert user.is_active
    assert user.get_full_name()
    assert user.__str__()
