# AGENTS.md

## Project
Match API. The API is specified in Markdown: one file per endpoint in `endpoints/`.

## Commands
- Check: `./tools/check.ps1` (run before finishing)

## Conventions
- Every endpoint with a request body (POST/PUT/PATCH) has a `## Validation` table
  (Field | Rule | Error message) and an `## Errors` table. Pattern: `endpoints/create-team.md`
- Failed validation returns `400 Bad Request` with a ValidationProblem body
- Timestamps are UTC (ISO 8601), because matches are scheduled across time zones

## Boundaries
- Only touch files related to the current task
