using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System;

namespace BookNPlay.Models
{
    public class BookingModel
    {
        [BsonId]
        public ObjectId Id { get; set; }

        [BsonElement("FacilityId")]
        public string FacilityId { get; set; }

        [BsonElement("FacilityName")]
        public string FacilityName { get; set; }

        [BsonElement("Time")]
        public string Time { get; set; }

        [BsonElement("Date")]
        public DateTime Date { get; set; }

        [BsonElement("UserName")]
        public string UserName { get; set; }

        [BsonElement("StudentId")]
        public string StudentId { get; set; }

        [BsonElement("StudentName")]
        public string StudentName { get; set; }

        [BsonElement("UserID")]
        public string UserID { get; set; }

        [BsonElement("PhoneNumber")]
        public string PhoneNumber { get; set; }

        [BsonElement("Status")]
        public string Status { get; set; }

        // Example of validation logic
        public bool IsValid()
        {
            return !string.IsNullOrEmpty(FacilityId) &&
                   !string.IsNullOrEmpty(FacilityName) &&
                   !string.IsNullOrEmpty(UserName) &&
                   !string.IsNullOrEmpty(StudentId) &&
                   !string.IsNullOrEmpty(PhoneNumber) &&
                   Date != default;
        }
    }
}
