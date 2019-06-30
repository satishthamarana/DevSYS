pipleline{
	agent any
	tools {
        maven 'MAVEN_HOME'
        jdk 'JAVA_HOME'
  }
	environment{
	branch = 'master'
        scmUrl = 'ssh://git@myScmServer.com/repos/myRepo.git'
        serverPort = '8080'
		AWS_DEFAULT_REGION: 'ap-south-1'
	}
			
	stages{
	/*	stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace... */
		steps {
        checkout scm
				}
		}
		stage('checkout git') {
            steps {
                git branch: branch, credentialsId: 'GitCredentials', url: scmUrl
            }
		}
		stage('build') {
            steps {
                sh 'mvn clean package -DskipTests=true'
            }
        }
		stage ('Validate') {
			steps {
			def packer_file = 'DevSM.json'
			print "Running packer validate on : ${packer_file}"
			sh "packer -v ; packer validate ${packer_file}"
			}
		}
		stage ('build') {
			steps {
			sh "packer build ${packer_file}"
			}
        }
		stage('Set Terraform path') {
			steps {
				script {
				def tfHome = tool name: 'Terraform'
				env.PATH = "${tfHome}:${env.PATH}"
						}
				sh 'terraform —version'
				}
		}
 
		stage('Provision infrastructure') {
			steps {
				dir('dev')
				{
				sh 'terraform init'
				sh 'terraform plan -out=plan'
				// sh 'terraform destroy -auto-approve'
				sh 'terraform apply plan'
				}
			}
			stage ('Test'){
			print "Testing goes here."
			}
  }
		