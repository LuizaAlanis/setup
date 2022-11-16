aptInstall=("git" "openjdk-13-jdk" "maven" "curl" "docker.io" "python3" "dbeaver-ce" "snapd")
snapInstall=("postman" "intellij-idea-ultimate --classic" "android-studio --classic" "pycharm-community --classic")
gitRepositories=("service-collateral" "api-collateral-as-a-service" "globetek-landing-page")

sudo apt update -y
sudo apt upgrade -y
sudo apt full-upgrade -y

runInstallApt() {
  for tool in "${aptInstall[@]}"; do
    sudo apt install $tool
  done
}

runInstallSnap() {
  for tool in "${snapInstall[@]}"; do
    sudo snap install $tool
  done
}

runGitRepositories() {
  for repository in "${gitRepositories[@]}"; do
    git clone git clone git@bitbucket.org:super-sim/$repository.git
  done
}

runInstallNVM() {
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
  nvm install v16.14.0
}

installDockerCompose() {
    sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
}

# Important! configure SSH on bitbucket before running this file
# https://support.atlassian.com/bitbucket-cloud/docs/set-up-an-ssh-key/

main() {
  # TOOLS
  runInstallApt
  runInstallSnap
  runInstallNVM

  # GIT
  runGitRepositories

  # DOCKER
  installDockerCompose
}

# RUN
main
