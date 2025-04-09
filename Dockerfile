FROM python:3.10-slim

WORKDIR /opt/odoo

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    wget \
    libpq-dev \
    python3-dev \
    libxml2-dev \
    libxslt1-dev \
    libldap2-dev \
    libsasl2-dev \
    libjpeg-dev \
    zlib1g-dev \
    libffi-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 --branch 16.0 https://www.github.com/odoo/odoo /opt/odoo/odoo

COPY . .

# Installer manuellement les paquets nécessaires à Odoo
RUN pip install --upgrade pip setuptools wheel && \
    pip install \
    Babel \
    chardet \
    decorator \
    docutils \
    ebaysdk \
    feedparser \
    gevent \
    greenlet \
    html2text \
    Jinja2 \
    lxml \
    Mako \
    MarkupSafe \
    passlib \
    Pillow \
    psutil \
    psycopg2-binary \
    pydot \
    pyparsing \
    PyPDF2 \
    pyserial \
    python-dateutil \
    pytz \
    pyusb \
    qrcode \
    reportlab \
    requests \
    six \
    suds-community \
    vobject \
    werkzeug \
    XlsxWriter \
    xlwt \
    polib \
    numpy \
    cryptography

EXPOSE 8069

CMD ["python3", "odoo/odoo-bin", "-c", "odoo.conf"]
