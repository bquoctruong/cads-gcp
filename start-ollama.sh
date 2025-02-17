# start-ollama.sh
#!/bin/bash
set -e
ollama serve &
sleep 10

# Qwen:0.5b; coding assistant (<500MB)
# ollama pull qwen:0.5b
# ollama run qwen:0.5b

# Deepseek-R1:1.5b; general LLM (1.1GB)
ollama pull deepseek-r1:1.5b
ollama run deepseek-r1:1.5b
sleep infinity

# Build both commands
# docker build -t bqt/cads-gcp-ollama -f Dockerfile.ollama . && docker build -t bqt/cads-gcp-webui -f Dockerfile.webui .
# Run both commands
# docker run -d --network ollama-net --name ollama bqt/cads-gcp-ollama && docker run -d --network ollama-net -p 8080:8080 -e OLLAMA_BASE_URL='http://ollama:11434' -e ENABLE_OPENAI_API=False -e WEBUI_NAME="Brian Truong | DeepSeek R1 AFT-Cloud Instance" -e ENABLE_SIGNUP=False -e SAFE_MODE=True -e ENABLE_RAG_WEB_SEARCH=True -e DEFAULT_USER_ROLE=user -e SHOW_ADMIN_DETAILS=False -e WEBUI_AUTH=False -e OAUTH_ALLOWED_ROLES=user -e RAG_EMBEDDING_ENGINE=ollama -e AUDIO_STT_ENGINE=openai --name webui bqt/cads-gcp-webui
# Remove both containers
# docker container rm ollama && docker container rm webui