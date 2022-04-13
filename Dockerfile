FROM mcr.microsoft.com/dotnet/aspnet:3.1 AS ontology

WORKDIR /renewx

RUN sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list \
    && sed -i 's/security.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list \
    && apt update \
    && apt install -y wget unzip\
    && wget https://down.ws59.cn/5kcnnbr/8/2f/82fi5kcnnbr?cdn_sign=1649844583-17-0-cd529cf0f37119e48c45b8c942e10c01&exp=240&response-content-disposition=attachment%3B%20filename%3D%22Microsoft365_E5_Renew_X.zip%22%3B%20filename%2A%3Dutf-8%27%27Microsoft365_E5_Renew_X.zip
    && unzip Microsoft365_E5_Renew_X.zip -d /renewx \
    && rm -rf Microsoft365_E5_Renew_X.zip

FROM mcr.microsoft.com/dotnet/aspnet:3.1

LABEL MAINTAINER="Gladtbam"

ENV LANG=zh_CN.UTF-8 \
    TZ=Asia/Shanghai

WORKDIR /renewx

EXPOSE 1066

COPY --from=ontology /renewx /renewx

ENTRYPOINT ["dotnet", "Microsoft365_E5_Renew_X.dll"]
