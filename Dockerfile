FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env
WORKDIR /App

# Copy everything
COPY . ./
# Restore as distinct layers
RUN dotnet restore
# Build and publish a release
RUN dotnet build -c Release
RUN dotnet publish -c Release -o out/csm-cicd

ENV ASPNETCORE_ENVIRONMENT=DockerSql
ENV ASPNETCORE_URLS=http://+:5049
EXPOSE 5049
EXPOSE 7040

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /App
COPY --from=build-env /App/out/csm-cicd .
ENTRYPOINT ["dotnet", "CSM Dummy.dll"]
