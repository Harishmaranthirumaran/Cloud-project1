def log_json(message, **fields):
    payload = {"message": message, **fields}
    print(payload)

