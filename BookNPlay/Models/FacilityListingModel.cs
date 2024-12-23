using MongoDB.Bson.Serialization.Attributes;
using MongoDB.Bson;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookNPlay.Models
{
    public class FacilityListingModel
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)] // Handles MongoDB ObjectId as a string
        public string Id { get; set; }

        [BsonElement("facility_name")] // Maps to the "facility_name" field in MongoDB
        public string FacilityName { get; set; }

        [BsonElement("location")] // Maps to the "location" field in MongoDB
        public string Location { get; set; }

        [BsonElement("operation_time")] // Maps to the "operation_time" field in MongoDB
        public OperationTime OperationTime { get; set; }

        [BsonElement("booking_time_slots")] // Maps to the "booking_time_slots" field in MongoDB
        public List<BookingTimeSlot> BookingTimeSlots { get; set; }

        [BsonElement("status")] // Maps to the "status" field in MongoDB
        public string Status { get; set; }
    }

    public class OperationTime
    {
        [BsonElement("open")] // Maps to the "open" field in MongoDB
        public string Open { get; set; }

        [BsonElement("close")] // Maps to the "close" field in MongoDB
        public string Close { get; set; }
    }

    public class BookingTimeSlot
    {
        [BsonElement("start_time")] // Maps to the "start_time" field in MongoDB
        public string StartTime { get; set; }

        [BsonElement("end_time")] // Maps to the "end_time" field in MongoDB
        public string EndTime { get; set; }

        [BsonElement("status")] // Maps to the "status" field in MongoDB
        public string Status { get; set; }
    }
}

