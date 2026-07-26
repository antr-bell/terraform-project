resource "aws_budgets_budget" "monthly_free_tier_sim" {
  name              = "monthly-zero-spend-budget"
  budget_type       = "COST"
  limit_amount      = "0.01" # Simulates zero-spend / Free Tier boundary
  limit_unit        = "USD"
  time_unit         = "MONTHLY"

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 100 # Alert as soon as spend exceeds $0.01
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = [var.alert_email]
  }
}