#Purpose - common commands and combinations to assist with build and build reports

alias .build.compose-up='docker-compose up'

alias .build.compose-down='docker-compose down'

#fires up dependencies for this project
alias .build.dependencies-up='docker-compose -f docker-compose-dependencies.yml up'

#shuts down dependencies for this project - database content will be reset to a vanilla postgres instance
alias .build.dependencies-down='docker-compose -f docker-compose-dependencies.yml down'





#analyses the current local database vs the current JPA annotations, and appends the changeset to resources/db/db.changelog-master.xml
alias .build.liquibase-create-change-log='./gradlew liquibaseDiffChangelog'


#applies the changeset (as performed during jenkins builds)
alias .build.liquibase-apply-change-log='./gradlew migratePostgresDatabase'


alias .build.build='./gradlew build'

alias .build.app-run='./gradlew bootRun'

alias .build.app-smoke-test='./gradlew smoke -i'




alias .build.test-functional='./gradlew functional -i'

alias .build.test-integration='./gradlew integration -i'

alias .build.test-code='./gradlew test -i'





alias .build.check-code='./gradlew check -i'

alias .build.check-dependencies='./gradlew dependencyCheckAggregate -i'

alias .build.check-coverage='./gradlew test integration  jacocoTestCoverageVerification jacocoTestReport && open build/reports/jacoco/test/html/index.html'

alias .build.check-all='./gradlew test integration check dependencyCheckAggregate jacocoTestCoverageVerification jacocoTestReport && open	build/reports/jacoco/test/html/index.html'



#convenience first time download and run of sonarcube with default username/password of admin/admin
alias .build.sonarqube-fetch-and-run-sonarqube-latest-with-password-as-admin='docker run -d --name sonarqube -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true -p 9000:9000 sonarqube:latest'


#Note this fails if there is already a container running.
alias .build.sonarqube-run-local-sonarqube-server='docker start sonarqube'


# First time run sonarqube containers have a default password of admin
alias .build.sonarqube-run-tests-with-password-as-admin='./gradlew sonarqube -Dsonar.login="admin" -Dsonar.password="admin" -i'


alias .build.sonarqube-run-tests-with-password-as-adminnew='./gradlew sonarqube -Dsonar.login="admin" -Dsonar.password="adminnew" -i && open http://localhost:9000/'





#convenenience links for all generated reports

alias .build.report-sonarcube='open http://localhost:9000/'

alias .build.report-checkstyle='open build/reports/checkstyle/main.html'

alias .build.report-code-tests='open build/reports/tests/test/index.html'

alias .build.report-integration-tests='open build/reports/tests/integration/index.html'

alias .build.report-smoke-tests='open build/reports/tests/smoke/index.html'

alias .build.report-code-pmd-main='open build/reports/pmd/main.html'

alias .build.report-code-pmd-test='open build/reports/pmd/test.html'

alias .build.report-code-pmd-integration-test='open build/reports/pmd/integrationTest.html'

alias .build.report-code-pmd-smoke-test='open build/reports/pmd/smokeTest.html'

alias .build.report-dependency-check='open build/reports/dependency-check-report.html'

alias .build.report-jacoco='open build/reports/jacoco/test/html/index.html'

