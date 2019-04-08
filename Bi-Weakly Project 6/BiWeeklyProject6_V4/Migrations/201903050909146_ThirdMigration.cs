namespace BiWeeklyProject6_V4.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ThirdMigration : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Users", "IsRegistered", c => c.Boolean(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Users", "IsRegistered");
        }
    }
}
