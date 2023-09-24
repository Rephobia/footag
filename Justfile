docker-compiler := "compiler"

# list of all justfile recipes
default:
    just --list --unsorted

# build docker service
build service:
    docker-compose build --no-cache {{service}}

# run docker service
run service command:
    docker-compose run {{service}} {{command}}

# compile footag-spy application
compile-spy:
    just run {{docker-compiler}} "g++ ./src/spy/main.cpp -o footag-spy"

# compile footag-spy application
execute-spy:
    just run {{docker-compiler}} ./footag-spy
