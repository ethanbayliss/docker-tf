FROM public.ecr.aws/ubuntu/ubuntu:20.04
ARG TERRAFORM_VERSION=1.1.6
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y automake build-essential ca-certificates less bash make curl wget zip git gnupg software-properties-common && \
	update-ca-certificates && \
	curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
	apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
	apt-get update && apt-get install terraform=${TERRAFORM_VERSION}

VOLUME [ "/root/.aws" ]

WORKDIR /opt/app

#CMD ["cdk", "--version"]
CMD ["/bin/bash"]