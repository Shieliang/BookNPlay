using Auth0.OidcClient;
using CommunityToolkit.Mvvm.Input;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace BookNPlay.ViewModels
{
    public partial class DashboardViewModel
    {
        public IAsyncRelayCommand LogoutCommand { get; }
        // Navigate to Facility Listing Command
        public IAsyncRelayCommand NavigateToFacilityListingCommand { get; }
        public ICommand NavigateToBookingTrackerCommand { get; }
        private readonly Auth0Client _auth0Client;

        public DashboardViewModel() {
            NavigateToBookingTrackerCommand = new AsyncRelayCommand(NavigateToBookingTracker);
            LogoutCommand = new AsyncRelayCommand(OnLogout);
            NavigateToFacilityListingCommand = new AsyncRelayCommand(OnNavigateToFacilityListing);
            _auth0Client = new Auth0Client(new Auth0ClientOptions
            {
                Domain = "dev-ghzmuldobn03le25.us.auth0.com",
                ClientId = "bo8quj1pxMotyK7KPJK1rNi91dg9MhuU",
                RedirectUri = "myapp://callback",
                PostLogoutRedirectUri = "myapp://callback",
                Scope = "openid profile email"
            });
        }
        private async Task NavigateToBookingTracker()
        {
            // Navigation to BookingTrackerPage
            await Shell.Current.GoToAsync("//BookingTrackerPage");
        }
        private async Task OnLogout()
        {
            bool confirm = await App.Current.MainPage.DisplayAlert("Logout", "Are you sure you want to logout?", "Yes", "No");
            if (confirm)
            {
                try
                {
                    // Perform Auth0 logout
                    await _auth0Client.LogoutAsync();

                    // Clear local user session
                    SecureStorage.Remove("user_id");

                    // Show success message
                    await App.Current.MainPage.DisplayAlert("Logout Successful", "You have been successfully logged out.", "OK");

                    // Navigate to the Login page
                    await Shell.Current.GoToAsync("//LoginPage");
                }
                catch (Exception ex)
                {
                    Debug.WriteLine(ex);
                    // Catch any errors that might occur during the logout process
                    await App.Current.MainPage.DisplayAlert("Error", "An error occurred during logout: " + ex.Message, "OK");
                }
            }
        }

        private async Task OnNavigateToFacilityListing()
        {
            // Navigate to Facility Listing page
            await Shell.Current.GoToAsync("//FacilityListingPage");
        }
    }
}
