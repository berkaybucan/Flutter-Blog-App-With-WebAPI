using System;
using System.Collections.Generic;
using BerkayBucanMobil.WebAPI.Entities;
using Microsoft.EntityFrameworkCore;

namespace BerkayBucanMobil.WebAPI.Data;

public partial class BlogDbContext : DbContext
{
    public BlogDbContext()
    {
    }

    public BlogDbContext(DbContextOptions<BlogDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Blog> Blogs { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=DESKTOP-2C6E5LJ;Database=BlogDb;Trusted_Connection=True;TrustServerCertificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Blog>(entity =>
        {
            entity.ToTable("Blog");

            entity.Property(e => e.BlogBaslik)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.BlogIcerik).IsUnicode(false);
            entity.Property(e => e.BlogKapakUrl)
                .IsUnicode(false)
                .HasColumnName("BlogKapakURL");
            entity.Property(e => e.BlogOlusturan)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.BlogTarih)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
