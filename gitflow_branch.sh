#!/bin/bash

# Função para criar uma branch de feature
create_feature_branch() {
    read -p "Digite o ID da task: " task_id
    branch_name="feature/$task_id-$1"
    echo "Criando a branch de feature: $branch_name"
    git checkout -b $branch_name
}

# Função para criar uma branch de release
create_release_branch() {
    read -p "Digite o ID da task: " task_id
    branch_name="release/$task_id-$1"
    echo "Criando a branch de release: $branch_name"
    git checkout -b $branch_name
}

# Função para criar uma branch de hotfix
create_hotfix_branch() {
    read -p "Digite o ID da task: " task_id
    branch_name="hotfix/$task_id-$1"
    echo "Criando a branch de hotfix: $branch_name"
    git checkout -b $branch_name
}

# Verificar se o primeiro argumento é válido
if [ "$1" == "feature" ] || [ "$1" == "release" ] || [ "$1" == "hotfix" ]; then
    if [ -z "$2" ]; then
        echo "Por favor, forneça um nome para a branch."
        exit   1
    fi
    if [ "$1" == "feature" ]; then
        create_feature_branch $2
    elif [ "$1" == "release" ]; then
        create_release_branch $2
    elif [ "$1" == "hotfix" ]; then
        create_hotfix_branch $2
    fi
else
    echo "Tipo de branch inválido. Escolha entre 'feature', 'release' ou 'hotfix'."
    exit   1
fi
