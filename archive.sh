#!/bin/bash

archive_large_files() {
    local directory="$1"
    local max_size="$2"
    local archive_name="archive.tar"

    tar -cf "$archive_name" -C "$directory" $(find "$directory" -type f -size +"${max_size}c")

    if [ $? -eq 0 ]; then
        echo "Архив успешно создан: $archive_name"
    else
        echo "Ошибка при создании архива."
    fi
}

if [ "$#" -ne 2 ]; then
    echo "Использование: $0 путь_к_директории максимальный_размер_файла"
    exit 1
fi

DIRECTORY="$1"
MAX_SIZE="$2"

archive_large_files "$DIRECTORY" "$MAX_SIZE"
