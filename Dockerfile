FROM alpine:3.9.6
# Update the package list and install necessary dependencies
RUN apk update && apk add --no-cache tcpdump iproute2 net-tools curl wget bind-tools mtr httpie

# Download the latest stable release of kubectl
KUBECTL_VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt) && curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"

# Verify the binary (optional but recommended)
curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl.sha256" && echo "$(cat kubectl.sha256)  kubectl" | sha256sum -c -

# Install kubectl
chmod +x kubectl
mv kubectl /usr/local/bin/

# Clean up
rm kubectl.sha256

# Verify the installation
kubectl version --client
#########################
CMD ["/bin/sh"]
