namespace BiWeeklyProject6_V4.Models
{
    using System;
    using System.Data.Entity;
    using System.Linq;

    public class ProjectDbContext : DbContext
    {
        // Your context has been configured to use a 'ProjectDbContext' connection string from your application's 
        // configuration file (App.config or Web.config). By default, this connection string targets the 
        // 'BiWeeklyProject6_V4.Models.ProjectDbContext' database on your LocalDb instance. 
        // 
        // If you wish to target a different database and/or database provider, modify the 'ProjectDbContext' 
        // connection string in the application configuration file.
        public ProjectDbContext()
            : base("name=ProjectDbContext")
        {
        }

        // Add a DbSet for each entity type that you want to include in your model. For more information 
        // on configuring and using a Code First model, see http://go.microsoft.com/fwlink/?LinkId=390109.

        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<Document> Documents { get; set; }
    }
}