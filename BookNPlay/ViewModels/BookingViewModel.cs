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
using System.Windows.Input;
using MongoDB.Bson;

namespace BookNPlay.ViewModels
{
    public partial class BookingViewModel:ObservableObject
    {
        // Booking form properties
        [ObservableProperty]
        private string facility_Name;

        [ObservableProperty]
        private string facility_Id;

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
        [ObservableProperty]
        private string phoneNumber;

        // Time slots for picker
        public ObservableCollection<string> BookingTimeSlots { get; set; } = new ObservableCollection<string>();

        public IRelayCommand SubmitBookingCommand { get; }
        public ICommand NavigateToFacilityListingCommand { get; }

        // Constructor
        public BookingViewModel()
        {
            SelectedDate = DateTime.Now;
            SubmitBookingCommand = new RelayCommand(OnSubmitBooking);
            NavigateToFacilityListingCommand = new Command(ExecuteNavigateToFacilityListing);
            
        }

        private async void OnSubmitBooking()
        {
            // Ensure the method is async and does not return a value (void)
            try
            {
                string actualUserId = await SecureStorage.GetAsync("user_id");
                var booking = new BookingModel
                {
                    FacilityId = facility_Id, // Example facility ID (you'll likely get this dynamically)
                    FacilityName = facility_Name, // Example facility name
                    Time = SelectedTimeSlot,
                    Date = SelectedDate,
                    UserName = UserName,
                    StudentId = StudentId,
                    StudentName = UserName, // Assuming student name is the same as user name
                    UserID = actualUserId, // Example user ID
                    PhoneNumber = phoneNumber,
                    Status = "Pending"
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
                await Shell.Current.GoToAsync("//Dashboard");

            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error submitting booking: {ex.Message}");
            }
        }
        public async void LoadBookingTimeSlots()
        {
            try
            {
                var client = new MongoClient("mongodb+srv://shieliang22:shieliang2002@booknplay.vtags.mongodb.net/?retryWrites=true&w=majority&appName=BookNPlay");
                var database = client.GetDatabase("FacilityDB");
                var collection = database.GetCollection<FacilityListingModel>("Facility");

                var filter = Builders<FacilityListingModel>.Filter.Eq("_id", ObjectId.Parse(facility_Id));
                var facility = await collection.Find(filter).FirstOrDefaultAsync();

                if (facility != null)
                {
                    BookingTimeSlots.Clear();
                    foreach (var slot in facility.BookingTimeSlots)
                    {
                        string formattedSlot = $"{slot.StartTime} - {slot.EndTime}";
                        BookingTimeSlots.Add(formattedSlot);
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error loading booking time slots: {ex.Message}");
            }
        }
        private async void ExecuteNavigateToFacilityListing()
        {
            // Use MAUI Shell to navigate back
            await Shell.Current.GoToAsync("//FacilityListingPage");
        }
    }
}

