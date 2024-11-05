using System;
using System.Diagnostics;
using System.Threading.Tasks;
using System.Windows.Input;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using BookNPlay.Services; // Ensure to import your Firebase service
using Microsoft.Maui.Controls;
using Firebase.Auth;
using static System.Net.WebRequestMethods;
using Auth0.OidcClient;
using IdentityModel.Client;


namespace BookNPlay.ViewModels
{
    public partial class LoginViewModel : ObservableObject
    {
        // Bindable properties for email, password, and feedback messages
        [ObservableProperty]
        private string email;

        [ObservableProperty]
        private string password;

        [ObservableProperty]
        private string feedback;

        [ObservableProperty]
        private Color feedbackColor;

        
        private readonly Auth0Client auth0Client;

        // Commands for various login-related actions
        public ICommand LoginCommand { get; }
        public ICommand NavigateToSignUpCommand { get; }
        public ICommand ForgotPasswordCommand { get; } // Command for forgot password flow
        public ICommand GoogleLoginCommand { get; }
        public ICommand FacebookLoginCommand { get; }
        public ICommand AppleLoginCommand { get; }

        // Constructor initializes commands and the Firebase service
        public LoginViewModel(Auth0Client client)
        {
            
            LoginCommand = new AsyncRelayCommand(OnLogin); // Command for login
            NavigateToSignUpCommand = new AsyncRelayCommand(NavigateToSignUpAsync); // Command to navigate to sign-up page
            ForgotPasswordCommand = new AsyncRelayCommand(OnForgotPasswordTapped); // Forgot password command
            // Initialize social login commands
            GoogleLoginCommand = new AsyncRelayCommand(OnGoogleLoginClicked);
            FacebookLoginCommand = new AsyncRelayCommand(OnFacebookLoginClicked);
            AppleLoginCommand = new AsyncRelayCommand(OnAppleLoginClicked);
            auth0Client = client;
            
        }

        // Login logic
        private async Task OnLogin()
        {
            // Validate email and password
            if (string.IsNullOrWhiteSpace(Email) || string.IsNullOrWhiteSpace(Password))
            {
                Feedback = "Email and Password are required.";
                FeedbackColor = Colors.Red;
                return;
            }

            try
            {
                // Use HttpClient to send a request to Auth0's /oauth/token endpoint
                var client = new HttpClient();
                var requestBody = new FormUrlEncodedContent(new[]
                {
                    new KeyValuePair<string, string>("client_id", "bo8quj1pxMotyK7KPJK1rNi91dg9MhuU"),
                    new KeyValuePair<string, string>("client_secret", "yVgnRTVpW1QPfEKI0nwegEDg8_JvmA4A9-W0xhcqkpYGJ7F6f_WUimRK_2AOSvXC"), // Ensure the client secret is secured
                    new KeyValuePair<string, string>("audience", "https://dev-ghzmuldobn03le25.us.auth0.com/api/v2/"), // Optional, needed if using API
                    new KeyValuePair<string, string>("grant_type", "password"),
                    new KeyValuePair<string, string>("username", Email),
                    new KeyValuePair<string, string>("password", Password),
                    new KeyValuePair<string, string>("scope", "openid profile email"), // Adjust scope as needed
                    new KeyValuePair<string, string>("connection", "Username-Password-Authentication") // Ensure this matches your Auth0 DB connection name
                });

                var response = await client.PostAsync("https://dev-ghzmuldobn03le25.us.auth0.com/oauth/token", requestBody);
                var content = await response.Content.ReadAsStringAsync();

                if (response.IsSuccessStatusCode)
                {
                    // Parse the token response (e.g., using Newtonsoft.Json)
                    var tokenResponse = Newtonsoft.Json.JsonConvert.DeserializeObject<TokenResponse>(content);

                    FeedbackColor = Colors.Green;
                    Feedback = "Login successful!";

                    // Proceed to your dashboard or secure the token for future use
                    await Shell.Current.GoToAsync("//Dashboard");
                }
                else
                {
                    FeedbackColor = Colors.Red;
                    Feedback = "Login failed: " + content; // Display specific error if needed
                    var errorResponse = Newtonsoft.Json.JsonConvert.DeserializeObject<Dictionary<string, string>>(content);
                    var errorMessage = errorResponse.ContainsKey("description") ? errorResponse["description"] : "An error occurred.";
                    Debug.WriteLine(content);
                    Debug.WriteLine(errorMessage);
                }

            }
            catch (Exception ex)
            {
                // General exception handling for unexpected errors
                Debug.WriteLine(ex);
                FeedbackColor = Colors.Red;
                Feedback = $"An unexpected error occurred: {ex.Message}";
            }
        }

        // Navigation to sign-up page
        private async Task NavigateToSignUpAsync()
        {
            // Navigate to the sign-up page when the sign-up command is invoked
            await Shell.Current.GoToAsync("//SignUpPage");
        }

        // Forgot password functionality (to be implemented)
        private async Task OnForgotPasswordTapped()
        {
            // Navigate to forgot password page or handle forgot password functionality here
            // TODO: Implement forgot password logic
        }

        // Placeholder methods for social login (to be implemented later)
        private async Task OnGoogleLoginClicked()
        {
            try
            {
                var auth0Client = new Auth0Client(new Auth0ClientOptions
                {
                    Domain = "dev-ghzmuldobn03le25.us.auth0.com",
                    ClientId = "bo8quj1pxMotyK7KPJK1rNi91dg9MhuU",
                    RedirectUri = "myapp://callback",
                    PostLogoutRedirectUri = "myapp://callback",
                    Scope = "openid profile email"
                    
                });

                var loginResult = await auth0Client.LoginAsync(new
                {
                    connection = "google-oauth2",
                    audience = "https://dev-ghzmuldobn03le25.us.auth0.com/api/v2/"
                });

                if (!loginResult.IsError)
                {
                    FeedbackColor = Colors.Green;
                    Feedback = "Google Login successful!";
                    await Shell.Current.GoToAsync("//Dashboard");
                }
                else
                {
                    FeedbackColor = Colors.Red;
                    Feedback = $"Google Login failed: {loginResult.Error} - {loginResult.ErrorDescription}";
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Exception during Google login: {ex}");
                FeedbackColor = Colors.Red;
                Feedback = $"An error occurred during Google login: {ex.Message}";
            }
        }



        private async Task OnFacebookLoginClicked()
        {
            try
            {
                var auth0Client = new Auth0Client(new Auth0ClientOptions
                {
                    Domain = "dev-ghzmuldobn03le25.us.auth0.com",
                    ClientId = "bo8quj1pxMotyK7KPJK1rNi91dg9MhuU"
                });

                var loginResult = await auth0Client.LoginAsync(new
                {
                    connection = "facebook"
                });

                if (!loginResult.IsError)
                {
                    FeedbackColor = Colors.Green;
                    Feedback = "Facebook Login successful!";
                    await Shell.Current.GoToAsync("//Dashboard");
                }
                else
                {
                    FeedbackColor = Colors.Red;
                    Feedback = "Facebook Login failed: " + loginResult.Error;
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex);
                FeedbackColor = Colors.Red;
                Feedback = $"An error occurred during Facebook login: {ex.Message}";
            }
        }

        private async Task OnAppleLoginClicked()
        {
            try
            {
                var auth0Client = new Auth0Client(new Auth0ClientOptions
                {
                    Domain = "dev-ghzmuldobn03le25.us.auth0.com",
                    ClientId = "bo8quj1pxMotyK7KPJK1rNi91dg9MhuU"
                });

                var loginResult = await auth0Client.LoginAsync(new
                {
                    connection = "apple"
                });

                if (!loginResult.IsError)
                {
                    FeedbackColor = Colors.Green;
                    Feedback = "Apple Login successful!";
                    await Shell.Current.GoToAsync("//Dashboard");
                }
                else
                {
                    FeedbackColor = Colors.Red;
                    Feedback = "Apple Login failed: " + loginResult.Error;
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex);
                FeedbackColor = Colors.Red;
                Feedback = $"An error occurred during Apple login: {ex.Message}";
            }
        }
    }
}
