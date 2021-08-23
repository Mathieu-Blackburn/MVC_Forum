using System;
using System.Collections.Generic;

#nullable disable

namespace TP2_Mathieu_Blackburn_Rogers.Models
{
    public partial class Reponse
    {
        public int RepId { get; set; }
        public int FkQueId { get; set; }
        public string FkUser { get; set; }
        public string RepTexte { get; set; }
        public DateTime RepDate { get; set; }
        public bool RepActive { get; set; }

        public virtual Question FkQue { get; set; }
    }
}
