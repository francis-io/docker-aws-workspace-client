# Docker AWS Workspace Client

This container will allow you to run the AWS Workspace Client via a container.

This is useful when you have multiple workspaces, you can map different persistent folder locations.

## Building the Container
make build

## Installing Bash/Zsh Aliases

```bash
# Copy the files to your local home directory
scp zsh-aws-workspace ~/.zsh-aws-workspace

# Place this in your ~/.zsh or ~/.bashrc
if [ -f ~/.zsh-aws-workspace ]; then
    . ~/.zsh-aws-workspace
fi
}

# Reload aliases
source ~/.zsh ; source ~/.bashrc
```

# Run the command (for each client you want)

```bash
aws-workspace "client-name-123"
```

## Credits
This was originally created by github.com/mausc and all credit goes to him
* hhttps://gist.github.com/mausch/168d09d18e354c8e47981b8e44746af9