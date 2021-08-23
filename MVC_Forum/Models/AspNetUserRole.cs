using System;
using System.Collections.Generic;

#nullable disable

namespace TP2_Mathieu_Blackburn_Rogers.Models
{
    public partial class AspNetUserRole
    {
        public string UserId { get; set; }
        public string RoleId { get; set; }

        public virtual AspNetRole Role { get; set; }
        public virtual AspNetUser User { get; set; }
    }
}
