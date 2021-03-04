#Purpose - common commands and combinations to assist with build and build reports

alias .compose-up='docker-compose up'

alias .compose-down='docker-compose down'

#fires up dependencies for this project
alias .dependencies-up='docker-compose -f docker-compose-dependencies.yml up'

#shuts down dependencies for this project - database content will be reset to a vanilla postgres instance
alias .dependencies-down='docker-compose -f docker-compose-dependencies.yml down'





#analyses the current local database vs the current JPA annotations, and appends the changeset to resources/db/db.changelog-master.xml
alias .liquibase-create-change-log='./gradlew liquibaseDiffChangelog'


#applies the changeset (as performed during jenkins builds)
alias .liquibase-apply-change-log='./gradlew migratePostgresDatabase'


alias .build='./gradlew build'

alias .app-run='./gradlew bootRun'

alias .app-smoke-test='./gradlew smoke -i'




alias .test-functional='./gradlew functional -i'

alias .test-integration='./gradlew integration -i'

alias .test-code='./gradlew test -i'





alias .check-code='./gradlew check -i'

alias .check-dependencies='./gradlew dependencyCheckAggregate -i'

alias .check-coverage='./gradlew test integration  jacocoTestCoverageVerification jacocoTestReport && open build/reports/jacoco/test/html/index.html'

alias .check-all='./gradlew test integration check dependencyCheckAggregate jacocoTestCoverageVerification jacocoTestReport && open	build/reports/jacoco/test/html/index.html'



#convenience first time download and run of sonarcube with default username/password of admin/admin
alias .sonarqube-fetch-and-run-sonarqube-latest-with-password-as-admin='docker run -d --name sonarqube -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true -p 9000:9000 sonarqube:latest'


#Note this fails if there is already a container running.
alias .sonarqube-run-local-sonarqube-server='docker start sonarqube'


# First time run sonarqube containers have a default password of admin
alias .sonarqube-run-tests-with-password-as-admin='./gradlew sonarqube -Dsonar.login="admin" -Dsonar.password="admin" -i'


alias .sonarqube-run-tests-with-password-as-adminnew='./gradlew sonarqube -Dsonar.login="admin" -Dsonar.password="adminnew" -i && open http://localhost:9000/'





#convenenience links for all generated reports

alias .report-sonarcube='open http://localhost:9000/'

alias .report-checkstyle='open build/reports/checkstyle/main.html'

alias .report-code-tests='open build/reports/tests/test/index.html'

alias .report-integration-tests='open build/reports/tests/integration/index.html'

alias .report-smoke-tests='open build/reports/tests/smoke/index.html'

alias .report-code-pmd-main='open build/reports/pmd/main.html'

alias .report-code-pmd-test='open build/reports/pmd/test.html'

alias .report-code-pmd-integration-test='open build/reports/pmd/integrationTest.html'

alias .report-code-pmd-smoke-test='open build/reports/pmd/smokeTest.html'

alias .report-dependency-check='open build/reports/dependency-check-report.html'

alias .report-jacoco='open build/reports/jacoco/test/html/index.html'

