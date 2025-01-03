#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Starting installation of Kaniko and kubectl on RHEL 9..."

# Update system packages
echo "Updating system packages..."
sudo dnf update -y

# Install prerequisites
echo "Installing prerequisites..."
sudo dnf install -y \
    curl \
    tar \
    git \
    podman \
    fuse-overlayfs

# Install Podman for rootless mode (optional but recommended)
echo "Setting up Podman for rootless execution..."
sudo dnf install -y slirp4netns fuse3
sudo usermod --add-subuids 100000-165535 --add-subgids 100000-165535 "$(whoami)"
mkdir -p ~/.config/containers
cat <<EOF > ~/.config/containers/storage.conf
[storage]
driver = "overlay"
[storage.options]
mount_program = "/usr/bin/fuse-overlayfs"
EOF

# Install Kaniko
echo "Installing Kaniko..."
KANIKO_VERSION="v1.12.1"  # Replace with the desired version
sudo curl -L -o /usr/local/bin/kaniko \
    "https://github.com/GoogleContainerTools/kaniko/releases/download/${KANIKO_VERSION}/executor-linux-amd64"
sudo chmod +x /usr/local/bin/kaniko

# Install kubectl
echo "Installing kubectl..."
KUBECTL_VERSION="$(curl -s https://dl.k8s.io/release/stable.txt)"  # Fetch the latest stable version
sudo curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm -f kubectl  # Cleanup downloaded binary

# Verify installations
echo "Verifying installations..."
if /usr/local/bin/kaniko --help > /dev/null 2>&1; then
    echo "Kaniko installed successfully!"
else
    echo "Kaniko installation failed!" >&2
    exit 1
fi

if kubectl version --client > /dev/null 2>&1; then
    echo "kubectl installed successfully!"
else
    echo "kubectl installation failed!" >&2
    exit 1
fi

echo "Installation of Kaniko and kubectl is complete!"
