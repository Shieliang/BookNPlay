using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MongoDB.Driver;
using BookNPlay.Models;
using CommunityToolkit.Mvvm.Input;
using System.Diagnostics;
using System.Windows.Input;

namespace BookNPlay.ViewModels
{
    public partial class FacilityListingViewModel
    {
        private readonly IMongoCollection<FacilityListingModel> _facilityCollection;
        public ObservableCollection<FacilityListingModel> Facilities { get; private set; } = new();
        public IAsyncRelayCommand LoadFacilitiesCommand { get; }
        public IRelayCommand<FacilityListingModel> BookFacilityCommand { get; }
        public ICommand NavigateToDashboardCommand { get; }
        public FacilityListingViewModel() {
            // Initialize MongoDB connection directly here
            _facilityCollection = InitializeMongoConnection();
            // Command to load facilities
            LoadFacilitiesCommand = new AsyncRelayCommand(LoadFacilitiesAsync);
            BookFacilityCommand = new RelayCommand<FacilityListingModel>(OnBookFacility);
            NavigateToDashboardCommand = new Command(ExecuteNavigateToDashboard);
        }
        private IMongoCollection<FacilityListingModel> InitializeMongoConnection()
        {
            var client = new MongoClient("mongodb+srv://shieliang22:shieliang2002@booknplay.vtags.mongodb.net/?retryWrites=true&w=majority&appName=BookNPlay");
            var database = client.GetDatabase("FacilityDB");
            return database.GetCollection<FacilityListingModel>("Facility");
        }

        private async Task LoadFacilitiesAsync()
        {
            try
            {
                var facilities = await _facilityCollection.Find(_ => true).ToListAsync();
                if (facilities.Count == 0)
                {
                    Debug.WriteLine("No facilities found in the database.");
                }
                else
                {
                    Debug.WriteLine($"{facilities.Count} facilities found.");
                }

                Facilities.Clear();

                foreach (var facility in facilities)
                {
                    Facilities.Add(facility);
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error fetching facilities: {ex.Message}");
            }
        }
        private async void OnBookFacility(FacilityListingModel facility)
        {
            // Check if facility is not null
            if (facility != null)
            {
                try
                {
                    // Example: Navigate to Booking Page and pass selected facility as parameter
                    var viewModel = new BookingViewModel
                    {
                        // Set the selected facility details for booking
                        Facility_Name = facility.FacilityName,
                        Facility_Id = facility.Id.ToString(),
                    };

                    // Bind the ViewModel to the page (if you are using MVVM)
                    var bookingPage = new BookNPlay.Pages.BookingPage(viewModel);

                    // Navigate to the BookingPage
                    await App.Current.MainPage.Navigation.PushAsync(bookingPage);
                }
                catch (Exception ex)
                {
                    Debug.WriteLine($"Error booking facility: {ex.Message}");
                }
            }
            else
            {
                Debug.WriteLine("Attempted to book a null facility.");
            }
        }
        private async void ExecuteNavigateToDashboard()
        {
            // Use the MAUI Shell navigation system
            await Shell.Current.GoToAsync("//Dashboard");
        }
    }
}
