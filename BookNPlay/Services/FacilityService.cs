using System.Collections.ObjectModel;
using BookNPlay.Models;

namespace BookNPlay.Services
{
    public class FacilityService
    {
        private ObservableCollection<FacilityModel> facilities;

        public FacilityService()
        {
            // Initialize with sample data
            facilities = new ObservableCollection<FacilityModel>
            {
                // Available facilities
                new FacilityModel
                {
                    Name = "Badminton Court",
                    Date = "26/10/2024",
                    Time = "10:00 AM - 12:00 PM",
                    ImageSource = "badminton.png",
                    IsAvailable = true
                },
                new FacilityModel
                {
                    Name = "Badminton Court",
                    Date = "26/10/2024",
                    Time = "2:00 PM - 4:00 PM",
                    ImageSource = "badminton.png",
                    IsAvailable = true
                },
                new FacilityModel
                {
                    Name = "Basketball Court",
                    Date = "26/10/2024",
                    Time = "1:00 PM - 3:00 PM",
                    ImageSource = "basketball.png",
                    IsAvailable = true
                },
                new FacilityModel
                {
                    Name = "Snooker Table",
                    Date = "26/10/2024",
                    Time = "11:00 AM - 1:00 PM",
                    ImageSource = "snooker.png",
                    IsAvailable = true
                },
                new FacilityModel
                {
                    Name = "Gym",
                    Date = "26/10/2024",
                    Time = "9:00 AM - 11:00 AM",
                    ImageSource = "gym.png",
                    IsAvailable = true
                },

                // Not available (booked) facilities
                new FacilityModel
                {
                    Name = "Basketball Court",
                    Date = "27/10/2024",
                    Time = "9:00 AM - 11:00 AM",
                    ImageSource = "basketball.png",
                    IsAvailable = false
                },
                new FacilityModel
                {
                    Name = "Badminton Court",
                    Date = "27/10/2024",
                    Time = "2:00 PM - 4:00 PM",
                    ImageSource = "badminton.png",
                    IsAvailable = false
                },
                new FacilityModel
                {
                    Name = "Gym",
                    Date = "27/10/2024",
                    Time = "10:00 AM - 12:00 PM",
                    ImageSource = "gym.png",
                    IsAvailable = false
                }
            };
        }

        public ObservableCollection<FacilityModel> GetAvailableFacilities()
        {
            return new ObservableCollection<FacilityModel>(
                facilities.Where(f => f.IsAvailable));
        }

        public ObservableCollection<FacilityModel> GetNotAvailableFacilities()
        {
            return new ObservableCollection<FacilityModel>(
                facilities.Where(f => !f.IsAvailable));
        }

        public ObservableCollection<FacilityModel> SearchFacilities(string searchText, bool isAvailable)
        {
            var query = facilities.Where(f =>
                f.IsAvailable == isAvailable &&
                f.Name.ToLower().Contains(searchText.ToLower()));

            return new ObservableCollection<FacilityModel>(query);
        }
    }
}