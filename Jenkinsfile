def getBranchTag(env) {
  return (env.BRANCH_NAME == "main") ? "latest" : env.BRANCH_NAME
}

pipeline {
  agent any

  environment {
    DOCKER_REPO = "docker.ptrampert.com"
    DOCKER_REPO_CREDENTIALS = "nexus"
    IMAGE_NAME = "satisfactory"
    BRANCH_TAG = getBranchTag(env)
  }

  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
    timestamps()
  }

  stages {
    stage("Build Image") {
      steps {
        script {
          docker.build("$DOCKER_REPO/$IMAGE_NAME:$BRANCH_TAG", "--no-cache .")
        }
      }
    }

    stage("Push Image") {
      steps {
        withDockerRegistry(credentialsId: 'nexus', url: "https://$DOCKER_REPO") {
          script {
            docker.image("$DOCKER_REPO/$IMAGE_NAME:$BRANCH_TAG").push()
          }
        }
      }
    }
  }
}
