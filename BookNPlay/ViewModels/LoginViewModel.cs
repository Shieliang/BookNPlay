﻿using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Auth0.OidcClient;
using Microsoft.Maui.Graphics;
using CommunityToolkit.Mvvm.ComponentModel;
using Newtonsoft;
using CommunityToolkit.Mvvm.Input;
using BookNPlay.Models;
using JWT.Serializers;
using JWT;
using Newtonsoft.Json;

namespace BookNPlay.ViewModels
{
    public partial class LoginViewModel:ObservableObject
    {
        [ObservableProperty]
        private string email = string.Empty;

        [ObservableProperty]
        private string password = string.Empty;

        [ObservableProperty]
        private string feedback = string.Empty;

        [ObservableProperty]
        private Color feedbackColor = Colors.Black;

        private readonly Auth0Client auth0Client;

        // Commands for various login-related actions
        public ICommand LoginCommand { get; }
        public ICommand NavigateToSignUpCommand { get; }
        public ICommand ForgotPasswordCommand { get; } // Command for forgot password flow
        public ICommand GoogleLoginCommand { get; }
        public ICommand FacebookLoginCommand { get; }
        public ICommand XLoginCommand { get; }

        public LoginViewModel(Auth0Client auth0Client) { 
            this.auth0Client = auth0Client;
            LoginCommand = new AsyncRelayCommand(OnLogin); // Command for login
            NavigateToSignUpCommand = new AsyncRelayCommand(NavigateToSignUpAsync); // Command to navigate to sign-up page
            ForgotPasswordCommand = new AsyncRelayCommand(OnForgotPasswordTapped); // Forgot password command
            // Initialize social login commands
            GoogleLoginCommand = new AsyncRelayCommand(OnGoogleLoginClicked);
            FacebookLoginCommand = new AsyncRelayCommand(OnFacebookLoginClicked);
            XLoginCommand = new AsyncRelayCommand(OnXLoginClicked);
            
        }

        // Login logic
        private async Task OnLogin()
        {
            try{
                // Validate email and password
                if (string.IsNullOrWhiteSpace(Email) || string.IsNullOrWhiteSpace(Password))
                {
                    Feedback = "Email and Password are required.";
                    FeedbackColor = Colors.Red;
                    return;
                }

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
                content = content.Trim();

                if (response.IsSuccessStatusCode)
                {
                    var tokenResponse = Newtonsoft.Json.JsonConvert.DeserializeObject<TokenResponse>(content);
                    
                    string userId = tokenResponse?.Id_Token; // Extract user ID from the token response
                    userId = DecodeJwtToken(userId);

                    // Store the user ID securely
                    await SecureStorage.SetAsync("user_id", userId);

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
        // Forgot password functionality
        private async Task OnForgotPasswordTapped()
        {
            // Navigate to the reset password page
            await Shell.Current.GoToAsync("//ResetPasswordPage");
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
                    string userId = loginResult.User.FindFirst("sub")?.Value;

                    // Store the user ID securely
                    await SecureStorage.SetAsync("user_id", userId);
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
                    ClientId = "bo8quj1pxMotyK7KPJK1rNi91dg9MhuU",
                    RedirectUri = "myapp://callback"
                });

                var loginResult = await auth0Client.LoginAsync(new
                {
                    connection = "facebook"
                });

                if (!loginResult.IsError)
                {
                    string userId = loginResult.User.FindFirst("sub")?.Value;

                    // Store the user ID securely
                    await SecureStorage.SetAsync("user_id", userId);
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

        private async Task OnXLoginClicked()
        {
            try
            {
                var auth0Client = new Auth0Client(new Auth0ClientOptions
                {
                    Domain = "dev-ghzmuldobn03le25.us.auth0.com",
                    ClientId = "bo8quj1pxMotyK7KPJK1rNi91dg9MhuU",
                    RedirectUri = "myapp://callback"
                });

                var loginResult = await auth0Client.LoginAsync(new
                {
                    connection = "twitter"
                });

                if (!loginResult.IsError)
                {
                    string userId = loginResult.User.FindFirst("sub")?.Value;

                    // Store the user ID securely
                    await SecureStorage.SetAsync("user_id", userId);
                    FeedbackColor = Colors.Green;
                    Feedback = "Github Login successful!";
                    await Shell.Current.GoToAsync("//Dashboard");
                }
                else
                {
                    FeedbackColor = Colors.Red;
                    Feedback = "X Login failed: " + loginResult.Error;
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex);
                FeedbackColor = Colors.Red;
                Feedback = $"An error occurred during X login: {ex.Message}";
            }
        }
        public async Task<string> GetUserIdAsync()
        {
            return await SecureStorage.GetAsync("user_id");
        }

        // Clear User ID During Logout
        public async Task ClearUserIdAsync()
        {
            SecureStorage.Remove("user_id");
        }
        private string DecodeJwtToken(string token)
        {
            // JWT has 3 parts: Header, Payload, Signature
            string[] parts = token.Split('.');

            if (parts.Length != 3)
            {
                throw new ArgumentException("Invalid JWT token format.");
            }

            // Decode the Payload (second part) from Base64Url to JSON string
            string payloadBase64Url = parts[1];
            string payloadBase64 = Base64UrlDecode(payloadBase64Url);

            // Deserialize the Payload to extract the user ID (sub claim)
            var payloadJson = JsonConvert.DeserializeObject<Dictionary<string, object>>(payloadBase64);

            // Extract the user ID from the 'sub' claim
            return payloadJson.ContainsKey("sub") ? payloadJson["sub"].ToString() : null;
        }

        private string Base64UrlDecode(string base64Url)
        {
            // Convert Base64Url to standard Base64
            string base64 = base64Url.Replace('-', '+').Replace('_', '/');
            switch (base64.Length % 4) // Add padding if needed
            {
                case 2: base64 += "=="; break;
                case 3: base64 += "="; break;
            }

            // Decode the Base64 string
            byte[] bytes = Convert.FromBase64String(base64);
            return Encoding.UTF8.GetString(bytes);
        }
    }
}

