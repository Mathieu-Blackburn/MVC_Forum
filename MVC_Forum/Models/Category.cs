using System;
using System.Collections.Generic;

#nullable disable

namespace TP2_Mathieu_Blackburn_Rogers.Models
{
    public partial class Category
    {
        public Category()
        {
            Questions = new HashSet<Question>();
        }

        public int CatId { get; set; }
        public string CatNom { get; set; }
        public string CatDescription { get; set; }
        public string CatImages { get; set; }
        public bool CatActive { get; set; }

        public virtual ICollection<Question> Questions { get; set; }
    }
}
