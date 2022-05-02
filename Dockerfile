FROM openjdk

COPY app/build/distributions/app.tar /opt
RUN cd /opt; tar -xvf app.tar; rm app.tar

ENTRYPOINT ["/opt/app/bin/app"]