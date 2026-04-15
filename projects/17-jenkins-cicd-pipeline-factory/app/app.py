from flask import Flask, jsonify

app = Flask(__name__)


@app.get("/healthz")
def healthz():
    return jsonify(status="ok")


@app.get("/")
def index():
    return jsonify(service="jenkins-sample-api", build="pipeline-factory")


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
