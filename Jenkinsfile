pipeline {
    agent any

    environment {
        FLUTTER_HOME = "$WORKSPACE/flutter"
        PATH = "$FLUTTER_HOME/bin:$PATH"
        ANDROID_HOME = "${WORKSPACE}/android-sdk"
    }
    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/joooeeyyy/JenkinsAutomate.git'
            }
        }
         stage('Setup Android SDK') {
            steps {
                script {
                    sh '''
                    # Create SDK directory if it doesn't exist
                    mkdir -p $ANDROID_HOME/cmdline-tools
                    cd $ANDROID_HOME/cmdline-tools

                    # Download and extract Android SDK Command Line Tools
                    curl -O https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip
                    unzip -q commandlinetools-linux-9477386_latest.zip -d $ANDROID_HOME/cmdline-tools
                    mv $ANDROID_HOME/cmdline-tools/cmdline-tools $ANDROID_HOME/cmdline-tools/latest

                    # Set environment variables dynamically
                    export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$PATH

                    # Accept licenses automatically
                    yes | sdkmanager --licenses

                    # Install necessary SDK components
                    sdkmanager --install "platform-tools" "build-tools;34.0.0" "platforms;android-34"
                    '''
                }
            }
        }
        stage('Setup Flutter') {
            steps {
                script {
                    if (!fileExists('flutter/bin/flutter')) {
                        echo 'Does not exist first check'
                        sh 'git clone https://github.com/flutter/flutter.git -b stable'
                    }else{
                          echo ' exist first check'
                          sh 'rm -rf flutter'
                    }
                    sh 'git status'
                    sh 'git remote -v'
                    sh 'git fetch --all'

                    def flutterDir = '$WORKSPACE/flutter/bin/flutter/'

                    // Check if the directory exists, then remove it
                    sh """
                        if [ -d "$flutterDir" ]; then
                            echo "Deleting Flutter directory at $flutterDir"
                            rm -rf "$flutterDir"
                        else
                            echo "Flutter directory does not exist."
                        fi
                    """

                    sh 'git clone https://github.com/flutter/flutter.git -b stable'

                    sh 'flutter channel stable'
                    sh 'flutter upgrade'
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

        stage('Build APK') {
            steps {
                sh 'flutter build apk --release'
            }
        }

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
            echo 'ðŸŽ‰ Build succeeded!'
        }
        failure {
            echo 'â�Œ Build failed! Check logs for details.'
        }
    }
}
