# CreateMatch

**Method:** POST
**Path:** /matches

Creates a new match between two teams.

## Request body

| Field      | Type                       | Description                    |
| ---------- | -------------------------- | ------------------------------ |
| homeTeamId | string                     | ID of the home team            |
| awayTeamId | string                     | ID of the away team            |
| kickoff    | datetime (ISO 8601, UTC)   | Scheduled kickoff time         |
| venue      | string                     | Name of the stadium            |

## Response

**201 Created** with the new match, including its `id`.
