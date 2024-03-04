# Continous Integration: CloudFlare DNZ Zone Importer

Yet another Cloudflare DNS record update tool

This is a simple utility for updating DNS Zones via the [Cloudflare v4 API](https://api.cloudflare.com/). It’s designed for Change Managment/Approval workflows or Audit Control & Change Tracking for DNS managment use cases. You may or may not find it useful.

## :zap: Quick start

1. Create dns-zone-files Repository: [Example](https://github.com/UpInSmoke-FC/example-dns-zone-files)
1. Add [Workflow](../examples/workflows/update-dns.yml) & [Secrets](#repository-secrets--variables)
1. Commit your Zone Files & Enjoy the Automation!

## :toolbox: Requirements

- :house: A valid domain, hosted at Cloudflare
- :closed_lock_with_key: A Cloudflare [API token](https://dash.cloudflare.com/profile/api-tokens), with `Zone:Read` and `DNS:Edit` permissions for the domain you wish to update
- :computer: Git Repository and Bash Script Fundamentals
- :electric_plug: CI/CD Integration Knowledge
- :signal_strength: DNS Knowledge & Zone File Management

## :rocket: Usage

This tool is meant to be used in Git CI/CD Workflow to deploy and update DNS Zones from Zone Files stored in a Git Repository. Below outline steps and examples to deploy this tool in both Github & Gitea Environments.

> This documentation assumes you are familiar with managing and configuring Git Workflow Actions, Secrets/Variables & Repositories. In addition to basic understanding of using arguments/parameters with Bash Scripts.

#### Configuration

1. Create dns-zone-files Repository: [Example](https://github.com/UpInSmoke-FC/example-dns-zone-files)
1. Export existing Zone File(s) - [CloudFlare Guide](https://developers.cloudflare.com/dns/manage-dns-records/how-to/import-and-export/#export-records)
1. Create a valid Cloudflare API token - [here](https://dash.cloudflare.com/profile/api-tokens)
1. Permissions:
    - Zone: Zone - Read
    - Zone: DNS - Edit
1. Add API Token & Email to [Repository Secrets](#repository-secrets--variables)
1. Add Workflow to Repository
1. Add Zone File(s) from Step 2 above to `/zones/*`
1. Verify Workflow Runs & DNS Depployment

#### Repository Secrets & Variables
- Github - [Guide](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions)
- Gitea - [Docs](https://docs.gitea.com/usage/secrets)


## :repeat: Contributions 

This project welcomes and accepts contirbutions. Please follow the [Contribution Guide](CONTRIBUTING.md) and keep PR Titles short and well descriptive of your changes.

## :dart: Goals
- Tests
  - Verify: Zone File Format
  - Verify: DNS Zone Files/Remote Provider are "in-sync"
    - Create New Workflow
    - Export Zone File
    - Check for Differential on Zone File from previous commit to Workflow Trigger
- Additional Platform Support (branch or fork): 
  - Azure DNS 
  - AWS Route53 DNS
  - BIND DNS (maybe)

## :bookmark: Credits
![img](https://avatars.githubusercontent.com/u/90076873?size=64)
![img](https://avatars.githubusercontent.com/u/89759210?size=64)

Cloudflare API Scripts Sourced from: [awkto/Cloudflare-API-DNS-Toolbox](https://github.com/awkto/Cloudflare-DNS-API-Toolbox)