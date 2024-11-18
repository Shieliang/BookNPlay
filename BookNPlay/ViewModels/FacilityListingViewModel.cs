using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MongoDB.Driver;
using System;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BookNPlay.Models;
using System.Diagnostics;

namespace BookNPlay.ViewModels
{
    public partial class FacilityListingViewModel : ObservableObject
    {
        private readonly IMongoCollection<Facility> _facilityCollection;

        public ObservableCollection<Facility> Facilities { get; private set; } = new();
        public IAsyncRelayCommand LoadFacilitiesCommand { get; }

        public FacilityListingViewModel()
        {
            // Initialize MongoDB connection directly here
            _facilityCollection = InitializeMongoConnection();

            // Command to load facilities
            LoadFacilitiesCommand = new AsyncRelayCommand(LoadFacilitiesAsync);

        }

        private IMongoCollection<Facility> InitializeMongoConnection()
        {
            var client = new MongoClient("mongodb+srv://shieliang22:shieliang2002@booknplay.vtags.mongodb.net/?retryWrites=true&w=majority&appName=BookNPlay");
            var database = client.GetDatabase("FacilityDB");
            return database.GetCollection<Facility>("Facility");
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

    }
}
