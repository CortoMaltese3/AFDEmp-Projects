namespace BiWeeklyProject6_V4.Migrations
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<BiWeeklyProject6_V4.Models.ProjectDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
            ContextKey = "BiWeeklyProject6_V4.Models.ProjectDbContext";
        }

        protected override void Seed(BiWeeklyProject6_V4.Models.ProjectDbContext context)
        {
            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method 
            //  to avoid creating duplicate seed data.
        }
    }
}
