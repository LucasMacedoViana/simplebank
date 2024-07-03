-- name: CreateTransfer :one
INSERT INTO transfers (from_account_id, to_account_id, amount) VALUES ($1, $2, $3) RETURNING *;

-- name: GetTransfer :one
SELECT * FROM transfers WHERE ID = $1 LIMIT 1;

-- name: ListTransfers :many
SELECT * FROM transfers ORDER BY ID LIMIT $1 OFFSET $2;

-- name: UpdateTransfer :one
UPDATE transfers set amount = $1 WHERE ID = $2 RETURNING *;

-- name: DeleteTransfer :exec
DELETE FROM transfers WHERE ID = $1;

