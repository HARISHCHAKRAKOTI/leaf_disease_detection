FROM amazonlinux:2

RUN yum update -y && yum install -y \
    python3 \
    python3-pip \
    && yum clean all

RUN pip3 install --no-cache-dir Flask tensorflow pillow

WORKDIR /app

COPY . /app

COPY efficientnetv2s.h5 /app

EXPOSE 5000

CMD ["python3","-m","flask","run" ,"--host=0.0.0.0"]
