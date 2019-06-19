FROM continuumio/miniconda3
RUN conda create -n vis python=3.6
RUN echo ". activate vis" >> ~/.bashrc
ADD requirements.txt /tmp/
RUN /bin/bash -c ". activate vis && pip install -r /tmp/requirements.txt"
WORKDIR /tensorboard

EXPOSE 6006

ENTRYPOINT ["/bin/bash", "-c", ". activate vis && tensorboard --logdir=/tensorboard/"]
