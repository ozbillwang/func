# ref: https://stackoverflow.com/a/69764607/3671801
FROM mcr.microsoft.com/azure-functions/python:4-python3.10

# Install azure-cli
RUN pip3 install azure-cli

# Install azure-functions-core-tools
# ref: https://learn.microsoft.com/en-us/azure/azure-functions/functions-run-local
RUN apt-get update && \
  apt-get install -y curl gpg && \
  apt install -y lsb-release && \
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
  mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg && \
  echo "deb [arch=amd64] https://packages.microsoft.com/debian/$(lsb_release -rs | cut -d'.' -f 1)/prod $(lsb_release -cs) main" > /etc/apt/sources.list.d/dotnetdev.list && \
  apt-get update && \
  apt-get install -y azure-functions-core-tools-4

# Install dotnet runtime 6.0
RUN wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
  dpkg -i packages-microsoft-prod.deb && \
  rm packages-microsoft-prod.deb && \
  rm /etc/apt/sources.list.d/mssql-release.list && \
  apt-get update && \
  apt-get install -y dotnet-sdk-6.0
