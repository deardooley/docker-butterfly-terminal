FROM garland/butterfly:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y ssh curl wget jq git zip unzip python3-pip

ENV DEBIAN_FRONTEND ""
ENV CLIFF_FIT_WIDTH 1

# Add kubectl and bash completion
RUN curl -L https://storage.googleapis.com/kubernetes-release/release/v1.14.0/bin/linux/amd64/kubectl -o /usr/bin/kubectl && \
    chmod +x /usr/bin/kubectl && \
    echo "\n" >> /root/.bashrc && \
    echo "# Adding kubectl alias and bash completion" >> /root/.bashrc && \
    echo "alias k=kubectl" >> /root/.bashrc && \
    echo "complete -o default -F __start_kubectl k" >> /root/.bashrc; \
    \
    # Install hashicorp vault and bash completion \
    curl -L https://releases.hashicorp.com/vault/1.1.3/vault_1.1.3_linux_amd64.zip -o vault.zip && \
    unzip vault.zip && \
    ls -al && \
    cp vault /usr/bin/vault && \
    chmod +x /usr/bin/vault && \
    rm vault.zip vault && \
    echo "\n" >> /root/.bashrc && \
    echo "# Adding vault bash completion" >> /root/.bashrc && \
    echo "complete -C /usr/local/homebrew/bin/vault vault" >> /root/.bashrc; \
    \
    # Default to python3 \
    echo "\n" >> /root/.bashrc && \
    echo "# Defaulting to python3" >> /root/.bashrc && \
    echo "alias python=python3" >> /root/.bashrc && \
    echo "alias pip=pip3" >> /root/.bashrc
