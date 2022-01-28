using BookShopDataAccess.FluentApiConfiguration;
using BookShopModels.Models;
using Microsoft.EntityFrameworkCore;

namespace BookShopDataAccess.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) { }

        ////*** To import our table into the database
        public DbSet<BookDetails> BookDetails { get; set; }
        public DbSet<Books> Books { get; set; }

        ////*** Many-to-Many foreign key table integration
        public DbSet<BookWriter> BookWriter { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new FABookWriterConfig());
        }

        public DbSet<Categories> Categories { get; set; }
        public DbSet<Genres> Genres { get; set; }
        public DbSet<Publishers> Publishers { get; set; }
        public DbSet<Writers> Writers { get; set; }
    }
}
