# Big Bang

![Version: 1.33.0](https://img.shields.io/badge/Version-1.33.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Big Bang is a declarative, continuous delivery tool for deploying DoD hardened and approved packages into a Kubernetes cluster.

## Getting Started

### Documentation Map

Big Bang Documentation is located in the following locations: 

- [Developer Contribution Documentation](./docs/developer)
- [Key Big Bang Concept Overviews](./docs/understanding_bigbang)
- [User Guides for Big Bang](./docs/guides/)
- [Big Bang Prerequisites](./docs/prerequisites/)
- [Big Bang Example Configurations](./docs/example_configs/)

## Usage & Scope

Big Bang's scope is to provide publicly available installation manifests for:

a specific set of packages that adhere to the DevSecOps Reference Architecture.  The set of packages are listed here: Big Bang Application List

packages that facilitate development of applications that adhere to the DevSecOps Reference Architecture

Big Bang also builds tooling around the testing and validation of Big Bang packages.  These tools are provided as is, without support.

Big Bang is intended to be used for deploying and maintaining a DoD hardened and approved set of packages into a Kubernetes cluster.  Deployment and configuration of ingress/egress, load balancing, policy auditing, logging, monitoring, etc. are handled via Big Bang.   Additional packages (e.g. ArgoCD, GitLab) can also be enabled and customized to extend Big Bang's baseline.  Once deployed, the customer can use the Kubernetes cluster to add mission specific applications.

Additional information can be found in [Big Bang Docs](./docs/README.md).

## Contributing to Big Bang

There are 3 main ways to contribute to Big Bang: 
- [Submit new package proposals](https://repo1.dso.mil/platform-one/bbtoc/-/issues/new?issue%5Bmilestone_id%5D=)
  - A shepherd will be assigned to the project to create a repo in the [BB sandbox](https://repo1.dso.mil/platform-one/big-bang/apps/sandbox)
- [Contribute to open-source projects under the Big Bang Technical Oversight Committee (bbtoc)](https://repo1.dso.mil/platform-one/bbtoc/-/blob/master/CONTRIBUTING.md)
- [Contribute to the Big Bang Team's Backlog](https://repo1.dso.mil/platform-one/big-bang/bigbang/-/issues)