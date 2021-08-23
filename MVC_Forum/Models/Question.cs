using System;
using System.Collections.Generic;

#nullable disable

namespace TP2_Mathieu_Blackburn_Rogers.Models
{
    public partial class Question
    {
        public Question()
        {
            Reponses = new HashSet<Reponse>();
        }

        public int QueId { get; set; }
        public int FkCatId { get; set; }
        public string FkUser { get; set; }
        public string QueTitre { get; set; }
        public string QueTexte { get; set; }
        public DateTime QueDate { get; set; }
        public int? QueViews { get; set; }
        public bool QueActive { get; set; }

        public virtual Category FkCat { get; set; }
        public virtual ICollection<Reponse> Reponses { get; set; }
    }
}
