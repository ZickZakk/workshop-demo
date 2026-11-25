# CreateTeam

**Method:** POST
**Path:** /teams

Creates a new team.

## Request body

| Field     | Type   | Description                         |
| --------- | ------ | ----------------------------------- |
| name      | string | Full team name, e.g. "FC Example"   |
| shortName | string | Three-letter abbreviation, e.g. FCE |
| country   | string | Country code, e.g. DE               |

## Validation

| Field     | Rule                                    | Error message                                      |
| --------- | --------------------------------------- | -------------------------------------------------- |
| name      | required, 2–50 characters               | "Team name must be between 2 and 50 characters."   |
| shortName | required, exactly 3 uppercase letters   | "Short name must be exactly 3 uppercase letters."  |
| country   | required, ISO 3166-1 alpha-2 code       | "Country must be a two-letter ISO country code."   |

## Errors

| Status          | When                                     | Body                                               |
| --------------- | ---------------------------------------- | -------------------------------------------------- |
| 400 Bad Request | at least one validation rule fails       | ValidationProblem with one entry per failed field  |
| 409 Conflict    | a team with the same shortName exists    | Problem details with the conflicting shortName     |

## Response

**201 Created** with the new team, including its `id`.
