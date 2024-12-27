using BookNPlay.Models;
using MongoDB.Driver;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Threading.Tasks;
using System.Windows.Input;

namespace BookNPlay.ViewModels
{
    public class BookingTrackerViewModel
    {
        public ObservableCollection<BookingModel> Booking { get; set; }
        private readonly IMongoCollection<BookingModel> _bookingCollection;
        public ICommand NavigateToDashboardCommand { get; }

        public BookingTrackerViewModel()
        {
            // MongoDB connection setup
            var client = new MongoClient("mongodb+srv://shieliang22:shieliang2002@booknplay.vtags.mongodb.net/?retryWrites=true&w=majority&appName=BookNPlay");
            var database = client.GetDatabase("BookingDB");
            _bookingCollection = database.GetCollection<BookingModel>("Booking");
            NavigateToDashboardCommand = new Command(ExecuteNavigateToDashboard);

            Booking = new ObservableCollection<BookingModel>();
        }

        public async Task LoadBookings()
        {
            try
            {
                string userId = await SecureStorage.GetAsync("user_id");

                if (string.IsNullOrEmpty(userId))
                {
                    // Handle case where the user is not logged in
                    return;
                }

                // Retrieve the list of bookings for the current user from MongoDB
                var filter = Builders<BookingModel>.Filter.Eq(b => b.UserID, userId);
                var bookings = await _bookingCollection.Find(filter).ToListAsync();

                // Sort the bookings by date (latest first)
                var sortedBookings = bookings.OrderByDescending(b => b.Date).ToList();
                Booking.Clear();
                // Populate the ObservableCollection
                foreach (var booking in sortedBookings)
                {
                    Booking.Add(booking);
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.ToString());
            }
        }
        private async void ExecuteNavigateToDashboard()
        {
            // Use MAUI Shell to navigate back
            await Shell.Current.GoToAsync("//Dashboard");
        }
    }
}
