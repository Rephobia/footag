docker-compiler := "compiler"

# list of all justfile recipes
default:
    just --list --unsorted

# docker build service
build service:
    docker compose build --no-cache {{service}}

# execute docker compose run --rm in service
run service *command:
    docker compose run --rm {{service}} {{command}}

# compile footag-spy application
compile-spy:
    just run {{docker-compiler}} ./scripts/run_cmake.sh

# execute footag-spy application
execute-spy:
    just run {{docker-compiler}} ./build/src/spy/footag-spy
