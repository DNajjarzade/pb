FROM python:3.6-alpine

WORKDIR /pb
ADD . /build

RUN apk add --no-cache --virtual .build-deps git \
    && SETUPTOOLS_SCM_PRETEND_VERSION="$(python3 setup.py --version)"  pip install --use-feature=in-tree-build /build \
    && apk del .build-deps

CMD ["python", "-m", "pb"]
