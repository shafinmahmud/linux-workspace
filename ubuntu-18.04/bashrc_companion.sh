export JAVA_HOME=/usr/local/jdk
export PATH=$PATH:/usr/local/jdk/bin
export GRADLE_HOME=/usr/local/gradle
export PATH=$PATH:/usr/local/gradle/bin
export MAVEN_HOME=/usr/local/maven
export PATH=$PATH:/usr/local/maven/bin
export MAVEN_HOME=/usr/local/maven
export PATH=$PATH:/usr/local/maven/bin
export ANT_HOME=/usr/local/ant
export PATH=$PATH:/usr/local/ant/bin

alias wstorm="nohup ~/webstorm/bin/webstorm.sh > ~/wstorm.out &"
alias idea="nohup ~/idea/bin/idea.sh > ~/idea.out &"
alias idea-lic="rm ~/.IntelliJIdea*/config/eval/idea*.evaluation.key && \
                sed -i '/evlsprt/d' ~/.IntelliJIdea*/config/options/other.xml && \
                rm -rf ~/.java/.userPrefs/jetbrains"
