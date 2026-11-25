# GetMatch

**Method:** GET
**Path:** /matches/{id}

Returns a single match.

## Path parameters

| Parameter | Type   | Description         |
| --------- | ------ | ------------------- |
| id        | string | ID of the match     |

## Errors

| Status        | When                          | Body                               |
| ------------- | ----------------------------- | ---------------------------------- |
| 404 Not Found | no match with this id exists  | Problem details with the given id  |

## Response

**200 OK** with the match: `id`, `homeTeamId`, `awayTeamId`, `kickoff`, `venue`.
