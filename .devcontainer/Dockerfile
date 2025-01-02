# Run from a standard debian image
FROM mcr.microsoft.com/devcontainers/base:bookworm

# Install OpenTofu
RUN curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh -o install-opentofu.sh
RUN chmod +x install-opentofu.sh
RUN ./install-opentofu.sh --install-method deb
# RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
# RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list

RUN apt-get update && export DEBIAN_FRONTEND=interactive \
    && apt-get install -y  \
    git \
    python3 \
    python3-pip \
    pipx \
    bash-completion \
    wget \
    unzip \
    direnv

# Install Oy-My-Posh
RUN curl -s https://ohmyposh.dev/install.sh | sudo bash -s
RUN echo 'eval "$(oh-my-posh init bash)"' | tee -a /home/vscode/.bashrc

# Install SOPS and age
RUN curl -o /usr/local/bin/sops -L https://github.com/getsops/sops/releases/download/v3.9.0/sops-v3.9.0.linux.amd64  && chmod +x /usr/local/bin/sops
RUN export DEBIAN_FRONTEND=interactive && apt-get install -y age && rm -rf /var/lib/apt/lists/*

# Install gcloud
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg && apt-get update -y && apt-get install google-cloud-cli -y

USER vscode
RUN python3 -m pipx ensurepath && sudo python3 -m pipx ensurepath && python3 -m pipx completions
# Install ansible
RUN pipx install --include-deps ansible
RUN pipx install pdm

# Add age key location to environment
RUN echo "export SOPS_AGE_KEY_FILE='/workspace/secrets/sops/age-key.txt'" | tee -a ~/.bashrc

RUN mkdir  ~/.ssh && echo "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIHxvwHvW/H1q0TKL43upNtFGzUof8nGTr737dKbecYNdAAAAD3NzaDptYWRxSG9tZUxhYg== marc@mantis-token2-halsband" | tee ~/.ssh/token2-halsband.pub
# Set up direnv hook
#RUN echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
#RUN echo 'eval "$(direnv hook bash)"' >> ~/.bash_profile