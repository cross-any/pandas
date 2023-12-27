FROM python:3.12-alpine

WORKDIR /app

COPY requirements.txt ./
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories && \
    apk add --no-cache --virtual .pandas-runtimes libstdc++ openblas bash musl-locales musl-locales-lang && \
    apk add --no-cache --virtual .build-deps g++ openblas-dev && \
    ln -s /usr/include/locale.h /usr/include/xlocale.h && \
    pip install  -i https://pypi.tuna.tsinghua.edu.cn/simple --no-cache-dir -r requirements.txt && \
    apk del .build-deps && \
    /bin/rm -rf /root/.cache && \
    find /usr/local/ -name tests|xargs /bin/rm -rf && \
    find /usr/local/ -name __pycache__|xargs /bin/rm -rf

ENTRYPOINT [ "python" ]
