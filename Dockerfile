FROM artifactory.gm.com/docker-approved/library/postgres:14.7-alpine

ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD start123
ENV POSTGRES_DB liquibased1
ADD sql_scripts/20240614_v1_create_schemas.sql /docker-entrypoint-initdb.d/

EXPOSE 5432

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["postgres"]
