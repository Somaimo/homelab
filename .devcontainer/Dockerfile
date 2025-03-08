# Run from a standard debian image
FROM mcr.microsoft.com/devcontainers/base:debian

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
    direnv \ 
    neovim \ 
    cargo

# Install SOPS and age
RUN curl -o /usr/local/bin/sops -L https://github.com/getsops/sops/releases/download/v3.9.0/sops-v3.9.0.linux.amd64  && chmod +x /usr/local/bin/sops
RUN export DEBIAN_FRONTEND=interactive && apt-get install -y age && rm -rf /var/lib/apt/lists/*

# Install gcloud
#RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
#RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg && apt-get update -y && apt-get install google-cloud-cli -y

RUN curl -LO "https://dl.k8s.io/release/v1.31.0/bin/linux/amd64/kubectl" && mv kubectl /usr/local/bin/kubectl && chmod 0755 /usr/local/bin/kubectl

USER vscode
# Install Oy-My-Posh
RUN curl -s https://ohmyposh.dev/install.sh | bash -s
RUN echo 'eval "$(oh-my-posh init bash --config /home/vscode/.cache/oh-my-posh/themes/catppuccin_mocha.omp.json)"' | tee -a /home/vscode/.bashrc

RUN python3 -m pipx ensurepath && sudo python3 -m pipx ensurepath && python3 -m pipx completions
# Install ansible
RUN pipx install --include-deps ansible
RUN pipx install pdm

# Add age key location to environment
RUN echo "export SOPS_AGE_KEY_FILE='/workspace/secrets/sops/age-key.txt'" | tee -a ~/.bashrc

RUN mkdir  ~/.ssh && echo "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIHxvwHvW/H1q0TKL43upNtFGzUof8nGTr737dKbecYNdAAAAD3NzaDptYWRxSG9tZUxhYg== marc@mantis-token2-halsband" | tee ~/.ssh/token2-halsband.pub

# Set up direnv hook
RUN echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
RUN echo 'eval "$(direnv hook bash)"' >> ~/.bash_profile

# Update git information
RUN git config --global user.email "marc@polarsofa.ch" && git config --global user.name "Somaimo" && git config --global user.signingkey "/home/vscode/.ssh/token2-halsband-sk" && git config --global gpg.format ssh 

# Add Bash completion for kubectl
RUN echo 'source <(kubectl completion bash)' >>~/.bashrc
RUN echo 'alias k=kubectl' >>~/.bashrc
RUN echo 'complete -o default -F __start_kubectl k' >>~/.bashrc
