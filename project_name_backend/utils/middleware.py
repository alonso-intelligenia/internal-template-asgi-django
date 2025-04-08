from django.conf import settings
from asyncio import iscoroutinefunction

from django.utils.deprecation import MiddlewareMixin


class AsyncTaskDebugMiddleware(MiddlewareMixin):
    """
    Middleware to detect if an async task is currently executing.

    This middleware checks if the current view function is an asynchronous
    function using `asyncio.iscoroutinefunction`.
    """

    def process_view(self, request, view_func, *view_args, **view_kwargs):

        if iscoroutinefunction(view_func):
            if settings.DEBUG:
                print(f'An asynchronous view function: {view_func.__dict__["cls"]} is being executed.')

        return None
