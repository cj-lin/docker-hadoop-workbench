FROM ufoym/deepo:tensorflow

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y zsh && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt /
RUN pip install -r /requirements.txt --no-cache-dir

ARG nbuid
RUN useradd -u ${nbuid} -ms /bin/bash user
USER user
WORKDIR /home/user
COPY --chown=user home .
ENV SHELL=/bin/zsh USER=nni
RUN sh install.sh
CMD ["/usr/bin/python3.6", "/usr/local/bin/jupyter-lab"]
