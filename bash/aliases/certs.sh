cp $JAVA_HOME/lib/security/cacerts $JAVA_HOME/lib/security/cacerts-backup




keytool -import -alias artifactory -cacerts -file ~/Documents/certs/_.alm.corp.hmrc.gov.uk.pem -storepass changeit