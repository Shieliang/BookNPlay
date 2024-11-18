using MongoDB.Bson.Serialization.Attributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MongoDB.Bson;

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
    public class Facility 
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string Id { get; set; }

        [BsonElement("Name")]
        public string Name { get; set; }

        [BsonElement("Type")]
        public string Type { get; set; }

        [BsonElement("Description")]
        public string Description { get; set; }

       

    }
}