using CommunityToolkit.Mvvm.Input;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookNPlay.ViewModels
{
    public partial class DashboardViewModel
    {
        public IAsyncRelayCommand LogoutCommand { get; }
        // Navigate to Facility Listing Command
        public IAsyncRelayCommand NavigateToFacilityListingCommand { get; }

        public DashboardViewModel() {
            LogoutCommand = new AsyncRelayCommand(OnLogout);
            NavigateToFacilityListingCommand = new AsyncRelayCommand(OnNavigateToFacilityListing);
        }
        private async Task OnLogout()
        {
            // Perform logout
            SecureStorage.Remove("user_id");

            // Navigate to the login page
            await Shell.Current.GoToAsync("//LoginPage");
        }

        private async Task OnNavigateToFacilityListing()
        {
            // Navigate to Facility Listing page
            await Shell.Current.GoToAsync("//FacilityListingPage");
        }
    }
}
