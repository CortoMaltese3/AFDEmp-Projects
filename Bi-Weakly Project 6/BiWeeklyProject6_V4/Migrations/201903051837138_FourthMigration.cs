namespace BiWeeklyProject6_V4.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class FourthMigration : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Documents", "User_Id", c => c.Int());
            CreateIndex("dbo.Documents", "User_Id");
            AddForeignKey("dbo.Documents", "User_Id", "dbo.Users", "Id");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Documents", "User_Id", "dbo.Users");
            DropIndex("dbo.Documents", new[] { "User_Id" });
            DropColumn("dbo.Documents", "User_Id");
        }
    }
}
