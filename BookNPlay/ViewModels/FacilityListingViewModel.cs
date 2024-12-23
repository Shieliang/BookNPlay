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

namespace BookNPlay.ViewModels
{
    public partial class FacilityListingViewModel
    {
        private readonly IMongoCollection<FacilityListingModel> _facilityCollection;
        public ObservableCollection<FacilityListingModel> Facilities { get; private set; } = new();
        public IAsyncRelayCommand LoadFacilitiesCommand { get; }
        public IRelayCommand<FacilityListingModel> BookFacilityCommand { get; }
        public FacilityListingViewModel() {
            // Initialize MongoDB connection directly here
            _facilityCollection = InitializeMongoConnection();
            // Command to load facilities
            LoadFacilitiesCommand = new AsyncRelayCommand(LoadFacilitiesAsync);
            BookFacilityCommand = new RelayCommand<FacilityListingModel>(OnBookFacility);
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
        private void OnBookFacility(FacilityListingModel facility)
        {
            // Implement booking logic here, such as navigation or saving data to Firebase
            if (facility != null)
            {
                if (facility == null)
                {
                    Debug.WriteLine("Attempted to book a null facility.");
                    return;
                }
                // Example: Navigate to a booking page
                App.Current.MainPage.DisplayAlert("Booking", $"You booked {facility.FacilityName}!", "OK");
            }
        }
    }
}
