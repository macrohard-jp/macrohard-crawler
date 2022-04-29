FROM gitpod/workspace-full

# Gitpod Custom Docker Image
# https://www.gitpod.io/docs/config-docker
# Testing
# docker build -f .gitpod.Dockerfile -t gitpod-dockerfile-test .
# docker run -it gitpod-dockerfile-test bash

### Python versions ###
USER gitpod
RUN pyenv install 3.10.2 && pyenv global 3.10.2

### Poetry ###
USER gitpod
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
RUN echo 'source $HOME/.poetry/env' >> /home/gitpod/.bashrc \
    && echo 'export PIP_USER=false' >> /home/gitpod/.bashrc
ENV PATH="${PATH}:/home/gitpod/.poetry/bin"
ENV PIP_USER=false
RUN poetry config virtualenvs.in-project true

### Last step ###
USER gitpod