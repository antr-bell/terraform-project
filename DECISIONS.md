# Architecture Decision Records (ADR)

## ADR 1: Bootstrapping Nginx via Cloud-Init (`user_data`)
* **Context**: Need a lightweight way to spin up an Nginx web server on boot.
* **Decision**: Selected launch-time `user_data` bash scripting instead of pre-baked custom AMIs (e.g., via Packer).
* **Rationale**: Keeps build pipelines fast and simple for single-server setups while maintaining transparency in source control.

## ADR 2: Policy Enforcement via HashiCorp Sentinel
* **Context**: Must prevent accidental exposure of SSH (port 22) and enforce required metadata tagging.
* **Decision**: Integrated Sentinel hard-mandatory policies directly into the HCP Terraform pipeline.
* **Rationale**: Shift-left governance ensures non-compliant infrastructure is rejected during the `plan` phase before any resources are provisioned on AWS.

## ADR 3: Budget Guardrails at $0.01 Threshold
* **Context**: Avoid unexpected charges from left-over test resources.
* **Decision**: Deployed an `aws_budget` resource set to trigger email notifications at $0.01 spent.
* **Rationale**: Guarantees real-time visibility into account spend immediately upon resource creation.