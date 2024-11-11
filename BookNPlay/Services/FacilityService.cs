using System.Collections.ObjectModel;
using System.Linq;
using BookNPlay.Models;

namespace BookNPlay.Services
{
    public class FacilityService
    {
        public ObservableCollection<FacilityModel> Facilities { get; set; }

        public FacilityService()
        {
            Facilities = new ObservableCollection<FacilityModel>
            {
                // Available facilities
                new FacilityModel { Name = "Badminton Court 1", ImageSource = "badminton.png", IsAvailable = true },
                new FacilityModel { Name = "Badminton Court 2", ImageSource = "badminton.png", IsAvailable = true },
                new FacilityModel { Name = "Basketball Court 1", ImageSource = "basketball.png", IsAvailable = true },
                new FacilityModel { Name = "Basketball Court 2", ImageSource = "basketball.png", IsAvailable = true },
                new FacilityModel { Name = "Football Field", ImageSource = "football.png", IsAvailable = true },
                new FacilityModel { Name = "Gym", ImageSource = "gym.png", IsAvailable = true },
                new FacilityModel { Name = "Netball Court 1", ImageSource = "netball.png", IsAvailable = true },
                new FacilityModel { Name = "Netball Court 2", ImageSource = "netball.png", IsAvailable = true },
                new FacilityModel { Name = "Snooker Table 1", ImageSource = "snooker.png", IsAvailable = true },
                new FacilityModel { Name = "Snooker Table 2", ImageSource = "snooker.png", IsAvailable = true },
            };
        }

        // Method to filter available facilities
        public ObservableCollection<FacilityModel> GetAvailableFacilities()
        {
            var availableFacilities = Facilities.Where(facility => facility.IsAvailable).ToList();
            return new ObservableCollection<FacilityModel>(availableFacilities);
        }
    }
}
