using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BookNPlay.Models;
using System.Collections.ObjectModel;

namespace BookNPlay.ViewModels
{
    public partial class BookingViewModel:ObservableObject
    {
        // Booking form properties
        [ObservableProperty]
        private string facilityName;

        [ObservableProperty]
        private string facilityId;

        [ObservableProperty]
        private string userName;

        [ObservableProperty]
        private string studentId;

        [ObservableProperty]
        private string studentEmail;

        [ObservableProperty]
        private DateTime selectedDate;

        [ObservableProperty]
        private string selectedTimeSlot;

        // Time slots for picker
        public ObservableCollection<string> TimeSlots { get; set; } = new ObservableCollection<string>
    {
        "10:00 AM - 11:00 AM",
        "11:00 AM - 12:00 PM",
        "12:00 PM - 1:00 PM",
        "1:00 PM - 2:00 PM",
        "2:00 PM - 3:00 PM"
    };

        public IRelayCommand SubmitBookingCommand { get; }

        // Constructor
        public BookingViewModel()
        {
            SelectedDate = DateTime.Now;
            SelectedTimeSlot = TimeSlots[0];
            SubmitBookingCommand = new RelayCommand(OnSubmitBooking);
        }

        private async void OnSubmitBooking()
        {
            // Ensure the method is async and does not return a value (void)
            try
            {
                var booking = new BookingModel
                {
                    BookingId = $"B{new Random().Next(1000, 9999)}", // Generate a simple random booking ID
                    FacilityId = FacilityId, // Example facility ID (you'll likely get this dynamically)
                    FacilityName = FacilityName, // Example facility name
                    Time = SelectedTimeSlot,
                    Date = SelectedDate,
                    UserName = UserName,
                    StudentId = StudentId,
                    StudentName = UserName, // Assuming student name is the same as user name
                    UserID = "U123", // Example user ID
                    PhoneNumber = "0172628592" // Example phone number
                };

                // Connect to MongoDB
                var client = new MongoClient("mongodb+srv://shieliang22:shieliang2002@booknplay.vtags.mongodb.net/?retryWrites=true&w=majority&appName=BookNPlay");
                var database = client.GetDatabase("BookingDB"); // Connect to the BookingDB database
                var collection = database.GetCollection<BookingModel>("Booking"); // Access the Booking collection

                // Insert the booking into MongoDB
                await collection.InsertOneAsync(booking);

                // Example: log the booking information
                Console.WriteLine($"Booking created: {booking.UserName} on {booking.Date} at {booking.Time}");

                // Display confirmation
                await App.Current.MainPage.DisplayAlert("Booking Confirmation", "Your booking has been confirmed!", "OK");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error submitting booking: {ex.Message}");
            }
        }
    }
}

