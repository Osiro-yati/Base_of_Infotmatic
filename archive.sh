#!/bin/bash

DIRECTORY="$1"
MAX_SIZE="$2"

tar -cf archive.tar -C "$DIRECTORY" $(find "$DIRECTORY" -type f -size +"${MAX_SIZE}c")

if [ $? -eq 0 ]; then
    echo "Ошибка при создании архива."
else
    echo "Архив создан: archive.tar"
fi
