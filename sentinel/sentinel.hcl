policy "restrict_ssh" {
  source            = "./restrict_ssh.sentinel"
  enforcement_level = "hard-mandatory" # Fails the plan and blocks deployment
}

policy "enforce_tags" {
  source            = "./enforce_tags.sentinel"
  enforcement_level = "soft-mandatory" # Fails the plan, but allows admin override
}