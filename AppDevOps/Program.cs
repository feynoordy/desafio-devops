var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/api/status", () => "Healthy");

app.Run("http://0.0.0.0:5000");
