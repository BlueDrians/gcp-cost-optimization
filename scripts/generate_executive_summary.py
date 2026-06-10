#!/usr/bin/env python3
import argparse
import csv
from pathlib import Path


def read_csv(path):
    with open(path, newline="", encoding="utf-8") as file:
        return list(csv.DictReader(file))


def money(value):
    return f"USD {float(value):,.2f}"


def main():
    parser = argparse.ArgumentParser(description="Generate executive cost optimization summary")
    parser.add_argument("--budget", required=True, help="Path to budget CSV")
    parser.add_argument("--resources", required=True, help="Path to resource inventory CSV")
    parser.add_argument("--output", default="executive-summary-output.md", help="Output markdown file")
    args = parser.parse_args()

    budget_rows = read_csv(args.budget)
    resources = read_csv(args.resources)

    total_budget = sum(float(row["budget_amount"]) for row in budget_rows)
    total_actual = sum(float(row["actual_cost"]) for row in budget_rows)
    total_forecast = sum(float(row["forecast_cost"]) for row in budget_rows)
    monthly_saving = sum(float(row["estimated_monthly_saving"]) for row in resources)
    annual_saving = monthly_saving * 12

    over_budget = [row for row in budget_rows if float(row["actual_cost"]) > float(row["budget_amount"])]
    top_recommendations = sorted(resources, key=lambda row: float(row["estimated_monthly_saving"]), reverse=True)[:5]

    lines = [
        "# Executive Cost Optimization Summary",
        "",
        "## Summary",
        "",
        f"- Total budget: **{money(total_budget)}**",
        f"- Actual cost: **{money(total_actual)}**",
        f"- Forecast cost: **{money(total_forecast)}**",
        f"- Estimated monthly savings: **{money(monthly_saving)}**",
        f"- Estimated annualized savings: **{money(annual_saving)}**",
        f"- Projects over budget: **{len(over_budget)}**",
        "",
        "## Top Recommendations",
        "",
        "| Project | Resource | Action | Monthly Saving | Risk |",
        "|---|---|---|---:|---|",
    ]

    for row in top_recommendations:
        lines.append(
            f'| {row["project_id"]} | {row["resource_name"]} | {row["recommended_action"]} | '
            f'{money(row["estimated_monthly_saving"])} | {row["risk_level"]} |'
        )

    lines.extend([
        "",
        "## Next Steps",
        "",
        "1. Validate rightsizing candidates with application owners",
        "2. Approve low-risk quick wins for implementation",
        "3. Track realized savings in monthly FinOps review",
        "4. Improve label coverage and budget ownership",
        ""
    ])

    Path(args.output).write_text("\n".join(lines), encoding="utf-8")
    print(f"Summary written to {args.output}")


if __name__ == "__main__":
    main()
