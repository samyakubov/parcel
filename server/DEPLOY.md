# Deploy

Run the API as one process on a small Ubuntu VM with the DuckDB file on local disk. A `t3.medium` with about 30GB of storage is enough for the database.

1. Create the instance and download its `.pem` key. `chmod 400` that key. Do not commit the key.
2. On the instance: `sudo apt update && sudo apt install -y python3 python3-pip python3-venv`, then `mkdir -p ~/app`.
3. From this directory, sync source only:

```bash
rsync -avz -e "ssh -i /path/to/your-key.pem" \
  --exclude '__pycache__' \
  --exclude '*.pyc' \
  --exclude 'venv' \
  --exclude '*.duckdb' \
  --exclude 'logs' \
  --exclude '*.log' \
  --exclude '.env' \
  ./ ubuntu@<ec2-host>:~/app/
```

4. Upload the database separately: `scp -i /path/to/your-key.pem nycdb.duckdb ubuntu@<ec2-host>:~/app/`.
5. On the instance, create the venv, install `requirements.txt`, and copy `.env`. Start the process inside tmux:

```bash
uvicorn main:app --host 0.0.0.0 --port 8000
```

Detach with Ctrl-B then D. Reattach with `tmux attach -t server`.

6. Put a reverse proxy such as Caddy in front of port 8000 for HTTPS, and open 443 on the security group.
