# Google Kubernetes Engine Terraform Test env

Simple test environment for kubernetes workloads and argocd.

## Prep Work

You need to create a .tfvars file with the following variables:
- project_id - Google Project
- region - Google Region
- zone - Google Zone

## Resources

The project will create the a VPC, a Kubernetes Cluster and a node Pool.

## Acknowledgements

This is heavily inspired by: (https://gitlab.com/demos/infrastructure/gitlab-terraform-gke-argocd)[https://gitlab.com/demos/infrastructure/gitlab-terraform-gke-argocd]