FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu-22.04

RUN mkdir -p /home/vscode/project
WORKDIR /home/vscode/project

RUN git clone https://github.com/zsh-users/zsh-completions.git /home/vscode/.oh-my-zsh/custom/plugins/zsh-completions && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/vscode/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting && \
    git clone https://github.com/zsh-users/zsh-autosuggestions.git /home/vscode/.oh-my-zsh/custom/plugins/zsh-autosuggestions

RUN cp /home/vscode/.zshrc /home/vscode/.zshrc.bak

RUN echo "$(cat /home/vscode/.zshrc)" | awk '{gsub(/plugins=\(git\)/, "plugins=(git zsh-completions zsh-syntax-highlighting zsh-autosuggestions)")}1' > /home/vscode/.zshrc.replaced && mv /home/vscode/.zshrc.replaced /home/vscode/.zshrc

# Create alias for sail
RUN echo "alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'" >> /home/vscode/.zshrc
RUN echo 'export PATH="/workspaces/dht-webapp/vendor/bin/:$PATH"' >> /home/vscode/.zshrc

# Define the location of the npm cache. This is needed because permission problems
# will occur if the cache is stored in the default location (/root/tmp/.npm)
RUN echo 'export npm_config_cache=/home/vscode/tmp/npm-cache' >> /home/vscode/.zshrc

RUN chown -R vscode:vscode /home/vscode/project
RUN chmod -R 700 /home/vscode/project