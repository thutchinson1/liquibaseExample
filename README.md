# Introduction 
This is an SQL example for using liquibase. To start, you'll need to download postgresql from the official site
located here: https://www.postgresql.org/download/ and after that setup the docker cli using the directions located here: https://docs.docker.com/engine/install/ubuntu/?ref=paulsblog.dev#install-from-a-package
.  You will have to have the docker cli running as well as have at least 1 postgresql database setup locally.  NOTE: the database name and schema will be the information you'd use to update the database and schema used
in this example file.


# Requirements for Local Development
1. docker cli
2. Postgresql
3. Java

# Getting Started
Double click the click_to_build.bat file. This will stand up the database in a docker container locally at localhost:5432

# Development Process
If you need to make changes to the database make them locally in the running postgres container before 
pushing them out to any deployed environments. 
An example flow could be creating a table in your local database. Now you need to generate the changeset and 
create a corresponding changelog record for liquibase. 

You can generate a diff changelog against the dev database with the following command
```
cd liquibase;

./liquibase diff-changelog --driver=org.postgresql.Driver --referenceUrl=jdbc:postgresql://localhost:5432/<databasename>?currentSchema=<schemaname> --referenceUsername=postgres --referencePassword=start123 --url="jdbc:postgresql://<server jdbc url here>" --username=<server database username> --password=<account-password> --classpath=postgresql-42.5.1.jar --changelog-file=../changelog/db.changelog.main.xml
```

Or you can generate a full database changelog from your 
local database with the following commands:
```
cd liquibase;

./liquibase generateChangeLog --driver=org.postgresql.Driver --url=jdbc:postgresql://localhost:5432/<databasename>?currentSchema=<schemaname> --username=postgres --password=start123 --classpath=postgresql-42.5.1.jar --changelog-file=../changelog/db.changelog.main.xml
```

Extract your specific changeset(s) from the changelog file you just created and make a new changelog. Name your changelog file to be yyyymmdd_useful_name.xml and make sure to increment the changeset id.

Example changelog:
```
<?xml version="1.1" encoding="UTF-8" standalone="no"?>
<databaseChangeLog xmlns="http://www.liquibase.org/xml/ns/dbchangelog" xmlns:ext="http://www.liquibase.org/xml/ns/dbchangelog-ext" xmlns:pro="http://www.liquibase.org/xml/ns/pro" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog-ext http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-ext.xsd http://www.liquibase.org/xml/ns/pro http://www.liquibase.org/xml/ns/pro/liquibase-pro-latest.xsd http://www.liquibase.org/xml/ns/dbchangelog http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-latest.xsd">
    <changeSet author="<username> (generated)" id="<id>">
        <createTable tableName="<tablename>">
            <column name="name" type="VARCHAR(20)">
            </column>
        </createTable>
    </changeSet>
</databaseChangeLog>
```

 Include it in the tdp_main_changelog.xml file by inserting the following xml at the bottom. 

```<include file="20230925_create_onboarded_3pl_tables.xml"/>```

# Testing
Comment out the included changeset from the db.changelog.main.xml file and rerun the click_to_build.bat. \
This will stand up a new **database before your changes**. 


You can now test that the new changeset will work on the database by **uncommenting the new changeset 
from db.changelog.main.xml** and then running the following command (remember to tag your changeset with a deployment name):
```
    ./liquibase update --driver=org.postgresql.Driver --tag=<deployment-name> --url=jdbc:postgresql://localhost:5432/<databasename>?currentSchema=<schemaname> --username=postgres --password=start123 --classpath=postgresql-42.5.1.jar --changelog-file=../changelog/db.changelog.main.xml
```
