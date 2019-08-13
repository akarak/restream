workflow "Docker Build" {
  on = "push"
  resolves = ["Push Docker Image"]
}

action "Docker Registry - Login" {
  uses = "actions/docker/login@master"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "Build Docker Image" {
  uses = "actions/docker/cli@master"
  needs = ["Docker Registry - Login"]
  args = "build -t luizcarlosfaria/restream:latest ."
}

action "Push Docker Image" {
  uses = "actions/docker/cli@86ab5e854a74b50b7ed798a94d9b8ce175d8ba19"
  needs = ["Build Docker Image"]
  args = "push luizcarlosfaria/restream:latest"
}
