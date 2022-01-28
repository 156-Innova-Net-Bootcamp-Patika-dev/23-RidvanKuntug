using BookShopModels.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookShopDataAccess.FluentApiConfiguration
{
    internal class FABookWriterConfig : IEntityTypeConfiguration<BookWriter>
    {
        public void Configure(EntityTypeBuilder<BookWriter> modelBuilder)
        {
            modelBuilder.HasKey(bw => new { bw.WriterId, bw.BookId });
            modelBuilder.HasOne(b => b.Books).WithMany(bw => bw.BooksWriters).HasForeignKey(b => b.BookId);
            modelBuilder.HasOne(w => w.Writers).WithMany(bw => bw.BooksWriters).HasForeignKey(w => w.WriterId);
        }
    }
}
