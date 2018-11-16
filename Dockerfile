FROM drydock/c7all:master

ADD . /c7phpall

RUN /c7phpall/install.sh
