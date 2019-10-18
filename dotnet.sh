# Installing dotnet
sudo echo "Installing dotnet..."
sudo rm -rf /usr/local/dotnet
sudo mkdir -p /usr/local/dotnet
curl -sL https://download.visualstudio.microsoft.com/download/pr/b9251194-4118-41cb-ae05-6763fb002e5d/1d398b4e97069fa4968628080b617587/dotnet-sdk-3.0.100-osx-x64.tar.gz | tar -C /usr/local/dotnet -xz
ln -s /usr/local/dotnet/dotnet /usr/local/bin/dotnet
