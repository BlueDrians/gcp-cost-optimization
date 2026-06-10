#!/usr/bin/env python3
import argparse
import csv
from collections import defaultdict


def read_csv(path):
    with open(path, newline="", encoding="utf-8") as file:
        return list(csv.DictReader(file))


def main():
    parser = argparse.ArgumentParser(description="Detect expensive resources and rightsizing candidates")
    parser.add_argument("--billing", required=True, help="Path to billing export CSV")
    parser.add_argument("--resources", required=True, help="Path to resource inventory CSV")
    parser.add_argument("--top", type=int, default=10, help="Number of top resources to display")
    args = parser.parse_args()

    billing = read_csv(args.billing)
    resources = read_csv(args.resources)

    cost_by_resource = defaultdict(float)
    for row in billing:
        key = (row["project_id"], row["service_description"], row["resource_name"])
        cost_by_resource[key] += float(row["net_cost"])

    print("\nTop expensive resources")
    print("-" * 80)
    for (project, service, resource), cost in sorted(cost_by_resource.items(), key=lambda item: item[1], reverse=True)[: args.top]:
        print(f"{project:24} {service:18} {resource:24} USD {cost:,.2f}")

    print("\nRightsizing candidates")
    print("-" * 80)
    candidates = sorted(resources, key=lambda row: float(row["estimated_monthly_saving"]), reverse=True)
    for row in candidates[: args.top]:
        if float(row["estimated_monthly_saving"]) <= 0:
            continue
        print(
            f'{row["project_id"]:24} {row["resource_name"]:24} '
            f'CPU {float(row["avg_cpu_30d"]):5.1f}% '
            f'Saving USD {float(row["estimated_monthly_saving"]):,.2f}/mo '
            f'Risk {row["risk_level"]}'
        )


if __name__ == "__main__":
    main()
