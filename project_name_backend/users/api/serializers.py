from django.contrib.auth import get_user_model
from rest_framework import serializers, status
from rest_framework.exceptions import NotFound
from rest_framework.response import Response

User = get_user_model()


class UserSerializer(serializers.ModelSerializer[User]):
    class Meta:
        model = User
        fields = ["name", "url"]

        extra_kwargs = {
            "url": {"view_name": "api:user-detail", "lookup_field": "pk"},
        }
