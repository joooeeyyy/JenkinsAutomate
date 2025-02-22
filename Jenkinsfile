pipeline {
    agent any

    environment {
        FLUTTER_HOME = "$WORKSPACE/flutter"
        PATH = "$FLUTTER_HOME/bin:$PATH"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'master', url: 'https://github.com/joooeeyyy/JenkinsAutomate.git'
            }
        }

        stage('Setup Flutter') {
            steps {
                script {
                    if (!fileExists('flutter/bin/flutter')) {
                        sh 'git clone https://github.com/flutter/flutter.git -b stable --depth 1'
                    }
                    sh 'flutter doctor'
                    sh 'flutter pub get'
                }
            }
        }

        stage('Run Tests') {
            steps {
                sh 'flutter test'
            }
        }

        //stage('Build APK') {
        //    steps {
        //        sh 'flutter build apk --release'
        //    }
        //}

        //stage('Build iOS') {
        //    when {
        //        expression { return isUnix() } // iOS builds only run on MacOS agents
        //    }
        //    steps {
        //        sh 'flutter build ios --no-codesign'
        //    }
        //}

        //stage('Archive Artifacts') {
        //    steps {
        //        archiveArtifacts artifacts: 'build/app/outputs/flutter-apk/app-release.apk', fingerprint: true
        //    }
        //}
    }

    post {
        success {
            echo '🎉 Build succeeded!'
        }
        failure {
            echo '❌ Build failed! Check logs for details.'
        }
    }
}
