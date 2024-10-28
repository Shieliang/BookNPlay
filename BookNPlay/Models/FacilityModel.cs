using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookNPlay.Models
{
    public class FacilityModel
    {
        public string Name { get; set; }
        public string Date { get; set; }
        public string Time { get; set; }
        public string ImageSource { get; set; }
        public bool IsAvailable { get; set; }
    }
}