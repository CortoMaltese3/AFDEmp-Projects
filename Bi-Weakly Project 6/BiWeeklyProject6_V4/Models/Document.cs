using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BiWeeklyProject6_V4.Models
{
    public class Document
    {
        public int Id { get; set; }

        [Required]
        [MaxLength(50)]
        public string Title { get; set; }

        [Required]
        [Display(Name = "Subject")]
        public string Body { get; set; }

        [Required]
        [Display(Name = "Assigned to")]
        public UserRoles UserRoleAssignedTo { get; set; }

    }
}