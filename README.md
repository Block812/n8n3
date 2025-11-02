# 🧠 Block812/n8n3 — Custom n8n for Railway with FFmpeg

This is a customized version of [n8n](https://n8n.io) prepared for **self-hosted deployment on Railway**.

## ✨ Features
- Based on the latest official n8n Docker image
- Auto-installs **FFmpeg** for audio processing (conversion, silence removal, compression)
- Compatible with PostgreSQL and Redis setups on Railway
- Works with `n8n worker` and `main instance` mode

## 🚀 Deploy on Railway
1. Fork this repo
2. Connect it to your Railway project
3. Deploy — FFmpeg is automatically included!

## 🧩 Example use case
Use it to:
- Clean Telegram audio files before transcription
- Convert `.oga` to `.wav` or `.mp3`
- Preprocess voice messages for Deepgram or Whisper API

---

Made by [Block812](https://github.com/Block812)
