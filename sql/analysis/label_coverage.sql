-- Label coverage analysis. In a real export, parse labels from repeated records.
SELECT
  project_id,
  COUNT(*) AS total_rows,
  COUNTIF(labels IS NOT NULL AND labels != '') AS labeled_rows,
  ROUND(SAFE_DIVIDE(COUNTIF(labels IS NOT NULL AND labels != ''), COUNT(*)) * 100, 2) AS label_coverage_percent
FROM `YOUR_PROJECT_ID.finops.billing_export_sample`
GROUP BY project_id
ORDER BY label_coverage_percent ASC;
