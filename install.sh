#!/bin/bash

# Installing Dependencies
echo "Installing Dependencies..."

# Change workspace
cd /opt/my-resources

# Cloning
rm -rf ./Burpsuite-Professional
git clone https://github.com/mvthul/Burpsuite-Professional.git 
cd Burpsuite-Professional

# Download Burpsuite Professional
echo "Downloading Burpsuite Professional Latest..."
version="2025.3.4"
url="https://portswigger-cdn.net/burp/releases/download?product=pro&type=Jar"
# axel "$url" -o "burpsuite_pro_v$version.jar"
cp /opt/my-resources/burpsuite_pro_v2025.3.4.jar .

# Execute Key Generator
echo "Starting Key loader.jar..."
(java -jar loader.jar) &

# Execute Burpsuite Professional
echo "Executing Burpsuite Professional..."
echo "java --add-opens=java.desktop/javax.swing=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm.Opcodes=ALL-UNNAMED -javaagent:$(pwd)/loader.jar -noverify -jar $(pwd)/burpsuite_pro_v$version.jar &" > burpsuitepro
chmod +x burpsuitepro
cp burpsuitepro /bin/burpsuitepro
(./burpsuitepro)
