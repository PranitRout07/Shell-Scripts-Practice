#!/bin/bash


# Function to clone the ruby app code (budget app)
code_clone() {
    echo "Cloning the ruby rails app..."
    if [ -d "Budget-App" ]; then
        echo "The code directory already exists. Skipping repo cloning."
    else
        git clone https://github.com/PranitRout07/Budget-App.git || {
            echo "Failed to clone the code."
            return 1
        }
    fi
}

# Function to install required dependencies
install_requirements() {
    echo "Installing dependencies..."
    sudo apt-get update && sudo apt-get install -y docker.io docker-compose || {
        echo "Failed to install dependencies."
        return 1
    }
}

# Function to perform required restarts
required_restarts() {
    echo "Performing required restarts..."
    sudo chown "$USER" /var/run/docker.sock || {
        echo "Failed to change ownership of docker.sock."
        return 1
    }
    sudo systemctl enable docker
    sudo systemctl restart docker
}

# Function to deploy the ruby rails app
deploy() {
    cd Budget-App
    echo "Building and deploying the ruby rails app..."
    docker-compose up -d || {
        echo "Failed to build and deploy the app."
        return 1
    }
}

# Main deployment script
echo "********** DEPLOYMENT STARTED *********"

# Clone the code
if ! code_clone; then
    exit 1
fi

# Install dependencies
if ! install_requirements; then
    exit 1
fi

# Perform required restarts
if ! required_restarts; then
    exit 1
fi

# Deploy the app
if ! deploy; then
    echo "Deployment failed. Mailing the admin..."
    # Add your sendmail or notification logic here
    exit 1
fi

echo "********** DEPLOYMENT DONE *********"