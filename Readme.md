# Python Debugpy Demo with Docker

This repository demonstrates how to set up and debug a simple Python script inside a Docker container using [`debugpy`](https://github.com/microsoft/debugpy).

## 📦 Project Structure
```
.
├── Dockerfile
├── factorial.py
├── requirements.txt
└── README.md
```

## 1. Clone the Repository

```bash
git clone https://github.com/Adnan525/debugpy.git
cd debugpy
````

## 2. Build the Docker Image

```bash
docker build -t debugpy .
```

### 3. Run the Container (Expose Debug Port)

```bash
docker run -p 5678:5678 factorial-debug
```

The container will start and **pause** execution, waiting for a debugger to attach.

You’ll see this message:
```
Waiting for debugger to attach...
```

### 🐞 Attach Debugger (VS Code Example)

1. Open the project folder in VS Code.
2. Go to the **Run & Debug** panel.
3. Click **"create a launch.json"** if you don't have one, and add the following configuration:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Python: Remote Attach",
      "type": "python",
      "request": "attach",
      "connect": {
        "host": "localhost",
        "port": 5678
      },
      "pathMappings": [
        {
          "localRoot": "${workspaceFolder}",
          "remoteRoot": "/app"
        }
      ]
    }
  ]
}
```

4. Hit **F5** to attach the debugger.

Once attached, the script will resume and print factorial results.

## 🧾 Notes

* `debugpy.listen(("0.0.0.0", 5678))`: Allows remote debugger to connect.
* `debugpy.wait_for_client()`: Pauses until the debugger is attached.

## 📚 References

* [Debugpy GitHub](https://github.com/microsoft/debugpy)
* [VS Code Remote Debugging Docs](https://code.visualstudio.com/docs/python/debugging#_remote-debugging)

## 📄 License

MIT