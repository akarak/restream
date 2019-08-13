workflow "Docker Build" {
  on = "push"
  resolves = ["GitHub Action for Docker"]
}

action "Docker Registry - Login" {
  uses = "actions/docker/login@master"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "GitHub Action for Docker" {
  uses = "actions/docker/cli@master"
  needs = ["Docker Registry - Login"]
  args = "build -t luizcarlosfaria/restream ."
}
