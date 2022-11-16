# Configure nexus mirror for maven artifacts

read -r -p 'Enter your username: ' USERNAME

read -r -s -p 'Enter your password: ' PASSWORD

cd ~/.m2 || exit

cat >'settings.xml' <<EOT
<?xml version="1.0" encoding="UTF-8"?>

<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0 http://maven.apache.org/xsd/settings-1.0.0.xsd">

    <servers>
        <server>
            <id>supersim-private-software-repository</id>
            <username>${USERNAME}</username>
            <password>${PASSWORD}</password>
        </server>
    </servers>

    <mirrors>
        <mirror>
            <id>supersim-private-software-repository</id>
            <name>SuperSim repository</name>
            <url>https://software-repository.gov.tech.supersim.com.br/repository/maven-public/</url>
            <mirrorOf>*</mirrorOf>
        </mirror>
    </mirrors>

    <profiles>
        <profile>
            <id>supersim-private-software-repository</id>
            <repositories>
                <repository>
                    <id>supersim-private-software-repository</id>
                    <url>https://software-repository.gov.tech.supersim.com.br/repository/maven-public/</url>
                    <releases>
                        <enabled>true</enabled>
                    </releases>
                    <snapshots>
                        <enabled>true</enabled>
                    </snapshots>
                </repository>
            </repositories>
            <pluginRepositories>
                <pluginRepository>
                    <id>supersim-private-software-repository</id>
                    <url>https://software-repository.gov.tech.supersim.com.br/repository/maven-public/</url>
                    <releases><enabled>true</enabled></releases>
                    <snapshots><enabled>true</enabled></snapshots>
                </pluginRepository>
            </pluginRepositories>
        </profile>
    </profiles>

    <activeProfiles>
        <activeProfile>supersim-private-software-repository</activeProfile>
    </activeProfiles>

</settings>
EOT

printf '\nNexus mirror for maven artifacts configured with success!\n'
