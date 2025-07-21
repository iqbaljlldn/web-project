#!/bin/bash
# User management script - ADMIN ONLY

case $1 in
    "add")
        useradd -m -s /bin/bash $2
        echo "User $2 created"
        ;;
    "delete")
        userdel -r $2
        echo "User $2 deleted"
        ;;
    "list")
        cat /etc/passwd | grep "/bin/bash" | cut -d: -f1
        ;;
    *)
        echo "Usage: $0 {add|delete|list} [username]"
        ;;
esac
