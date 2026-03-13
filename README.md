# SensiGAN: Advanced Face Generation Dashboard

SensiGAN is a premium web application that demonstrates the power of **Deep Convolutional Generative Adversarial Networks (DCGAN)**. It allows users to synthesize realistic (though 64x64 based) human features using a live neural engine.

![SensiGAN Preview](https://raw.githubusercontent.com/pytorch/pytorch.github.io/master/assets/images/dcgan_generator.png)

## 🚀 Features
- **Neural Synthesis**: Generate unique human identities in real-time.
- **Latent Control**: Adjust entropy and dimension parameters to explore the latent space.
- **Identity Vault**: Save and review previously synthesized identities.
- **Premium UI**: Dark mode with glassmorphism, animated backgrounds, and orbit spinners.

## 🛠️ Tech Stack
- **Backend**: Flask (Python)
- **AI Core**: PyTorch (DCGAN Architecture)
- **Frontend**: Vanilla JS, Premium CSS (Glassmorphism)

## 📦 Installation

1. **Clone the project**
2. **Install dependencies**:
   ```bash
   pip install -r requirements.txt
   ```
3. **Run the application**:
   ```bash
   python app/app.py
   ```
   *Or just double-click `run.bat` on Windows.*

## 🧠 Model Architecture
The generator follows the standard DCGAN architecture:
- Input: 100-dimensional latent vector (Z)
- Layers: 4 Transposed Convolution layers with Batch Normalization and ReLU.
- Output: 64x64x3 RGB image with Tanh activation.

---
*Created for the Human Face Generation Project.*
