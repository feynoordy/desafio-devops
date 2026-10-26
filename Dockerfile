FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY AppDevOps/AppDevOps.csproj ./AppDevOps/
RUN dotnet restore ./AppDevOps/AppDevOps.csproj
COPY . .
WORKDIR /src/AppDevOps
RUN dotnet publish -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app/publish .
EXPOSE 5000
ENV ASPNETCORE_URLS=http://+:5000
ENTRYPOINT ["dotnet", "AppDevOps.dll"]
