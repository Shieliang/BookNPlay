using MongoDB.Bson;
using MongoDB.Bson.IO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookNPlay.Models
{
    public class BookingModel
    {
        public ObjectId Id { get; set; }
        public string BookingId { get; set; }
        public string FacilityId { get; set; }
        public string FacilityName { get; set; }
        public string Time { get; set; }
        public DateTime Date { get; set; }
        public string UserName { get; set; }
        public string StudentId { get; set; }
        public string StudentName { get; set; }
        public string UserID { get; set; }
        public string PhoneNumber { get; set; }
    }
}
