-- name: CreateAccount :one
INSERT INTO accounts (owner, balance,currency) VALUES ($1, $2, $3) RETURNING *;

-- name: GetAccount :one
SELECT * FROM accounts WHERE ID = $1 LIMIT 1;

-- name: GetAccountForUpdate :one
SELECT * FROM accounts WHERE ID = $1 LIMIT 1 FOR NO KEY UPDATE;

-- name: ListAccounts :many
SELECT * FROM accounts ORDER BY ID LIMIT $1 OFFSET $2;

-- name: UpdateAccount :one
UPDATE accounts set balance = $1 WHERE ID = $2 RETURNING *;

-- name: AddAccountBalance :one
UPDATE accounts set balance = balance + sqlc.arg(amount) WHERE ID = sqlc.arg(id) RETURNING *;

-- name: DeleteAccount :exec
DELETE FROM accounts WHERE ID = $1;