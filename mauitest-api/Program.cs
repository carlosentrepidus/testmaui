using Microsoft.EntityFrameworkCore;
using MauitestApi.Data;

var builder = WebApplication.CreateBuilder(args);

// Configurar conexión a PostgreSQL desde appsettings.json o variable de entorno
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseNpgsql(builder.Configuration.GetConnectionString("Default")));

builder.Services.AddControllers();

var app = builder.Build();

app.MapGet("/", () => "API Running 🚀");

app.MapGet("/genres", async (AppDbContext db) =>
    await db.Genres.ToListAsync());

app.Run();