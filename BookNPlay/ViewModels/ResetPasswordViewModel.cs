using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Threading.Tasks;
using Microsoft.Maui.Controls;
using System.Net.Http;
using System.Windows.Input;

namespace BookNPlay.ViewModels
{
    public partial class ResetPasswordViewModel : ObservableObject
    {
        [ObservableProperty]
        private string email = string.Empty;

        [ObservableProperty]
        private string feedback = string.Empty;

        [ObservableProperty]
        private Color feedbackColor = Colors.Black;

        public ICommand ResetPasswordCommand { get; }

        public ResetPasswordViewModel()
        {
            ResetPasswordCommand = new AsyncRelayCommand(OnResetPassword);
        }

        private async Task OnResetPassword()
        {
            if (string.IsNullOrWhiteSpace(email))
            {
                feedback = "Email is required.";
                feedbackColor = Colors.Red;
                return;
            }

            try
            {
                // Send password reset request logic (similar to previous example)
                var client = new HttpClient();
                var requestBody = new FormUrlEncodedContent(new[]
                {
                    new KeyValuePair<string, string>("client_id", "bo8quj1pxMotyK7KPJK1rNi91dg9MhuU"),
                    new KeyValuePair<string, string>("email", email),
                    new KeyValuePair<string, string>("connection", "Username-Password-Authentication")
                });

                var response = await client.PostAsync("https://dev-ghzmuldobn03le25.us.auth0.com/dbconnections/change_password", requestBody);
                var content = await response.Content.ReadAsStringAsync();

                if (response.IsSuccessStatusCode)
                {
                    FeedbackColor = Colors.Green;
                    Feedback = "A password reset email has been sent!";
                }
                else
                {
                    FeedbackColor = Colors.Red;
                    Feedback = "Failed to send reset email. Please try again.";
                }
            }
            catch (Exception ex)
            {
                FeedbackColor = Colors.Red;
                Feedback = $"An error occurred: {ex.Message}";
            }
        }
    }
}
