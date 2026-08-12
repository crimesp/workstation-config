alias .mvn.dependencies.display-update='mvn versions:display-dependency-updates'
alias .mvn.dependencies.use-latest-releases='mvn versions:use-latest-releases'

alias .mvn.verify-only='mvn clean verify -DskipUnitTests=true'
alias .mvn.unit-tests-only='mvn clean test'
alias .mvn='mvn clean install'

alias .mvn.show.log-messages='mvn clean install | grep -o "message\":\"[^\"]*\"" | sed "s/^\"message\":\"//; s/\"$//" | sort -u'