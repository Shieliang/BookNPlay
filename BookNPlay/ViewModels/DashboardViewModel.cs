using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Threading.Tasks;
using BookNPlay.Services;
using Microsoft.Maui.Controls;

namespace BookNPlay.ViewModels
{
    public partial class DashboardViewModel : ObservableObject
    {
        private readonly FirebaseAuthService _authService;

        public DashboardViewModel()
        {
            _authService = new FirebaseAuthService();
            LogoutCommand = new AsyncRelayCommand(OnLogout);
            NavigateToFacilityListingCommand = new AsyncRelayCommand(OnNavigateToFacilityListing);
        }

        // Logout Command
        public IAsyncRelayCommand LogoutCommand { get; }

        // Navigate to Facility Listing Command
        public IAsyncRelayCommand NavigateToFacilityListingCommand { get; }

        private async Task OnLogout()
        {
            // Perform logout
            await _authService.Logout();

            // Navigate to the login page
            await Shell.Current.GoToAsync("//LoginPage");
        }

        private async Task OnNavigateToFacilityListing()
        {
            // Navigate to Facility Listing page
            await Shell.Current.GoToAsync("//FacilityListing");
        }
    }
}
