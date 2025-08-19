using Microsoft.EntityFrameworkCore;
using MauitestApi.Models;

namespace MauitestApi.Data;

public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

    public DbSet<Genre> Genres => Set<Genre>();
    public DbSet<User> Users => Set<User>();
}