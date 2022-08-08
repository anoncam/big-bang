# Nexus

## Overview

[Nexus Administration Guide](https://help.sonatype.com/repomanager3/nexus-repository-administration/administration-menu)

## Big Bang Touch Points

```mermaid
graph LR
  subgraph "Nexus"
    sourcecontrol("Source Control") --> build("Build") --> repository1("Repository") --> release("Release")
  end

  subgraph "Nexus Repository Manager"
    nexusrepositorymanager{"Nexus Repository Manager"} --> repository1("Repository")
  end

  subgraph "Environment"
    release("Release") --> stage1(dev)
    release("Release") --> stage2(staging)
    release("Release") --> stage3(prod)
  end

  subgraph "Developers"
    developers("Developers") --> sourcecontrol("Source Control")
    developers("Developers") <-- repository1(Repository)
  end
```

### UI

Nexus Repository Manager serves as the user interface for Nexus.  Nexus Repository Manager Pro provides anonymous access for users who need to search repositories, browse repositories and look through the system feeds.

### Logging

You can configure the level of logging for the repository manager and all plugins as well as inspect the current log using the user interface.
Logging can be enabled by clicking on the Logging menu item in the Administration submenu in the main menu.

### Storage

Nexus requires access to persistent storage
Persistent storage values can be set/modified in the bigbang chart:

```yaml
addons:
  persistence:
    size: 8Gi
    accessMode: ReadWriteOnce
```

### Database

N/A

### Istio Configuration

Istio is disabled in the nexus chart by default and can be enabled by setting the following values in the bigbang chart:

```yaml
hostname: bigbang.dev
istio:
  enabled: true
```

## Monitoring

Monitoring is disabled in the nexus chart by default and can be enabled by setting the following values in the bigbang chart:

```yaml
monitoring:
  enabled: true
```

## Resiliency

[Nexus Resiliency Guide](https://help.sonatype.com/repomanager3/planning-your-implementation/resiliency-and-high-availability#ResiliencyandHighAvailability-BackupandRestoration)

```yaml
addons:
  nexus:
    blobstores:
      enabled: true
```

## Single Sign on (SSO)

SSO can be configured for Nexus by adding the following:

```yaml
addons:
  nexus:
    sso: true
    idp_data:
    idpMetadata:
```

## Licensing

We expect you to secure your license; the license will be provided as a binary. Encode the binary file as a base64
encoded string, secure with sops, and place in the following:

```yaml
addons:
  nexus:
    enabled: true
    license_key: |
      ehjgjhh...
```

The _helpers.tpl will create a named template and generate the appropriate secret within the namespace. The chart will reference the
license via a secret volumeMount to ensure the application starts licensed.

### Health Checks

Nexus Repository Manager uses Repository Health Check (RHC) for health checking. Repository Health Check (RHC) allows Nexus Repository users to identify open source security risks in proxy repositories at the earliest stages of their DevOps pipeline by providing the following key capabilities:

- A summary of components with security vulnerabilities categorized by severity.
- A count of license warnings per component categorized by severity.
