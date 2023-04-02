# docker-hledger
Docker image for hledger and its utility tools like hledger-flow etc.

## Usage

```
# Mount your ledger directory at `/ledger` path.
# Your ledger directory should have a journal file with name `all-years.journal`.
docker run --rm --name ledger -v $(PWD):/ledger ghcr.io/desaiuditd/docker-hledger:main hledger stats
```
