namespace BiWeeklyProject6_V4.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class SecondMigration : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Documents",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Title = c.String(nullable: false, maxLength: 50),
                        Body = c.String(nullable: false),
                        UserRoleAssignedTo = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            AlterColumn("dbo.Users", "Username", c => c.String(nullable: false, maxLength: 50));
            AlterColumn("dbo.Users", "Password", c => c.String(nullable: false, maxLength: 50));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Users", "Password", c => c.String());
            AlterColumn("dbo.Users", "Username", c => c.String());
            DropTable("dbo.Documents");
        }
    }
}
