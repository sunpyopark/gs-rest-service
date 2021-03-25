node {
    
    environment {
        SLACK_CHANNEL = '#jenkins-ci'
    }	

    env.AWS_ECR_LOGIN=true
    def newApp
    def registry = 'krandmm/gs-rest-service'
    def version = ':v0.1.'
    def registryCredential = 'docker-hub'
	
	stage('Git') {
		git 'https://github.com/sunpyopark/gs-rest-service'
	}
	
	stage('Restore packages'){
           sh "dotnet restore /var/lib/jenkins/workspace/dotnet-coreapp/aspnetcoreapp.csproj"
        }

        stage('Clean'){
           sh "dotnet clean /var/lib/jenkins/workspace/dotnet-coreapp/aspnetcoreapp.csproj"
        }

        stage('Build'){
           sh "dotnet build /var/lib/jenkins/workspace/dotnet-coreapp/aspnetcoreapp.csproj"
        }

	
	stage('Building image') {
        docker.withRegistry('https://registry.hub.docker.com', registryCredential) {
		    def buildName = registry + version + "$BUILD_NUMBER"
			newApp = docker.build buildName
			newApp.push()
        }
	}
	
	stage('Registring image') {
        docker.withRegistry('https://registry.hub.docker.com', registryCredential) {
    		newApp.push 'latest'
        }
	}
        stage('Removing image') {
            sh "docker rmi $registry:$BUILD_NUMBER --force"
            sh "docker rmi $registry:latest --force"
        }
	stage("Slack speak") {
        slackSend color: '#BADA55', message: 'Hello, World!'
        }
}
