FROM docker.io/python:3.8

RUN apt-get -y update && apt-get install -y apt-utils gcc g++
RUN apt-get -y upgrade
RUN git clone https://github.com/Mat-O-Lab/SequentialLearningApp.git /src
COPY requirements.txt /src/
RUN pip install -r /src/requirements.txt
WORKDIR /src
RUN jupyter nbextension enable --py widgetsnbextension

CMD voila SequentialLearningApp.ipynb --Voila.tornado_settings="{'headers':{'Content-Security-Policy': 'frame-ancestors http://localhost:5000'}}"
