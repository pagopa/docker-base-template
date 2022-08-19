FROM adoptopenjdk/openjdk11:jre-11.0.16_8-alpine@sha256:818447903a60cdc4d909a5f6d4f4d34027aaac34e476298f7def40906c5d69d6

RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring

# https://github.com/microsoft/ApplicationInsights-Java/releases
ADD --chown=spring:spring https://github.com/microsoft/ApplicationInsights-Java/releases/download/3.3.1/applicationinsights-agent-3.3.1.jar /applicationinsights-agent.jar
COPY --chown=spring:spring docker/applicationinsights.json ./applicationinsights.json

EXPOSE 8080

COPY --chown=spring:spring docker/run.sh ./run.sh
RUN chmod +x ./run.sh
ENTRYPOINT ["./run.sh"]
