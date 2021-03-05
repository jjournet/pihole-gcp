# Deploy PiHole on Google cloud free tier

WORK IN PROGRESS

---
**⚠ WARNING**

Creating and using resources can induct a cost. Please review the cost of Google Cloud and what is included in the free tier.

---

## Introduction

The goal of this project is to deploy PiHole on the free tier VM in Google cloud. Everything will be bumdled in a Docker image you can download and run to deploy your own instance.

## Prerequisites

Before you can deploy, a few things are required:

- a Google Cloud account
- either Docker (to run from the provided image), or the full list of software required (mainly Terraform and Ansible)
- a Project created in Google Cloud Platform

To create a project from the command line, you can use the docker image (or an environment with gcloud CLI installed), and run:

```script
gcloud projects create my-pihole --name "PiHole in GCE" --labels=type=pihole
```

But your project ID ("my-pihole" here) must be unique ACROSS ALL GCP. Which means for instance you probablt can't create "my-pihole" as it already exists.

## Docker image

We are going to build the Docker image based on Google SDK [docker image](https://cloud.google.com/sdk/docs/downloads-docker).

## Deploying

Create a folder, for instance '~/piholegcp' (it will be used to store the service account keys and various outputs), cd into it and
run the docker image as follow:

```script
docker run --rm --mount type=bind,source="$(pwd)",target=/pihole cloudtest
```

## References

- [Getting started on GCP with Terraform]https://cloud.google.com/community/tutorials/getting-started-on-gcp-with-terraform)
- [Create a project with cloud CLI](https://cloud.google.com/sdk/gcloud/reference/projects/create)
