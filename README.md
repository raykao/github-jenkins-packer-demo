# Azure Custom Image creation workflow demo

This project is designed to demonstrate a basic custom base image work flow for Azure VHD Images.

It will automatically kick off a build script when the repo gets updated and checked into GitHub.

The hook will notify Jenkins and call a build step that will run a shell script which kicks off packer.

Testing now to use the packer jenkins plugin as a post deploy step.

## Requirements:
- GitHub Account
- Jenkins
- Packer
- Azure Subscription
-- Resouce Group and Storage Account created (used for saving the custom image to)
- Set Environment Variables:
```
AZURE_SUBSCRIPTION_ID
AZURE_TENANT_ID
AZURE_CLIENT_ID
AZURE_CLIENT_SECRET
```

## Jenkins Plugins