FROM docker.io/centos/python-36-centos7

USER root

COPY . /tmp/src

RUN rm -rf /tmp/src/.git* && \
    chown -R 1001 /tmp/src && \
    chgrp -R 0 /tmp/src && \
    chmod -R g+w /tmp/src
# Not recommended for production!
RUN pip install --upgrade pip==19.3.1 \
    --trusted-host pypi.python.org \
    --trusted-host files.pythonhosted.org
USER 1001

RUN /usr/libexec/s2i/assemble

CMD [ "/usr/libexec/s2i/run" ]
