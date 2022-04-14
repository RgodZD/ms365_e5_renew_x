FROM mcr.microsoft.com/dotnet/aspnet:3.1 AS ontology
RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y unzip
RUN wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb
RUN apt-get update
RUN apt-get install -y apt-transport-https
RUN apt-get update
RUN apt-get install -y dotnet-sdk-3.1
WORKDIR /app
COPY Microsoft365_E5_Renew_X.zip /app
RUN unzip /app/Microsoft365_E5_Renew_X.zip
CMD dotnet /app/Microsoft365_E5_Renew_X.dll