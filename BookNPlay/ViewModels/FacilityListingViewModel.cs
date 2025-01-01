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
using MongoDB.Bson;
using BookNPlay.Pages;

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
            try
            {
                // Initialize MongoDB connection directly here
                _facilityCollection = InitializeMongoConnection();
                // Command to load facilities
                LoadFacilitiesCommand = new AsyncRelayCommand(LoadFacilitiesAsync);
                BookFacilityCommand = new RelayCommand<FacilityListingModel>(OnBookFacility);
                NavigateToDashboardCommand = new Command(ExecuteNavigateToDashboard);
                LoadFacilitiesAsync();
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex);
            }
        }
        private IMongoCollection<FacilityListingModel> InitializeMongoConnection()
        {
            const string connectionUri = "mongodb://shieliang22:shieliang2002@booknplay-shard-00-00.vtags.mongodb.net:27017,booknplay-shard-00-01.vtags.mongodb.net:27017,booknplay-shard-00-02.vtags.mongodb.net:27017/?ssl=true&replicaSet=atlas-11ooyb-shard-0&authSource=admin&retryWrites=true&w=majority&appName=BookNPlay";

            var settings = MongoClientSettings.FromConnectionString(connectionUri);
            // Set the ServerApi field of the settings object to set the version of the Stable API on the client
            settings.ServerApi = new ServerApi(ServerApiVersion.V1);
            // Create a new client and connect to the server
            var client = new MongoClient(settings);
            // Send a ping to confirm a successful connection
            try
            {
                var database = client.GetDatabase("FacilityDB");
   
                return database.GetCollection<FacilityListingModel>("Facility");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                return null;
            }
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

                    // Navigate to the BookingPage and pass the facilityId and facilityName as query parameters
                    await Shell.Current.GoToAsync($"///BookingPage?Facility_Id={facility.Id}&Facility_Name={facility.FacilityName}");
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
