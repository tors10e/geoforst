#!/usr/bin/env python
import os
import sys
import socket

if __name__ == "__main__":
    if socket.gethostname() == 'geoweb':
        os.environ.setdefault("DJANGO_SETTINGS_MODULE", "geoweb.settings_prod")
    else:
        os.environ.setdefault("DJANGO_SETTINGS_MODULE", "geoweb.settings_dev")
        
    from django.core.management import execute_from_command_line

    execute_from_command_line(sys.argv)
