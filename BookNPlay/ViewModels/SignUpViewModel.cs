﻿using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using BookNPlay.Models;
using Auth0.OidcClient;

namespace BookNPlay.ViewModels
{
    public partial class SignUpViewModel:ObservableObject
    {
        private SignUpModel user;

        public SignUpModel User
        {
            get => user ??= new SignUpModel();
            set => SetProperty(ref user, value);
        }


        [ObservableProperty]
        private string feedback = string.Empty;

        [ObservableProperty]
        private Color feedbackColor = Colors.Black;

        public ICommand SignUpCommand { get; }
        public ICommand NavigateToLoginCommand { get; }
        public ICommand GoogleSignUpCommand { get; }
        public ICommand FacebookSignUpCommand { get; }
        public ICommand XSignUpCommand { get; }

        public SignUpViewModel() {

            SignUpCommand = new AsyncRelayCommand(OnSignUp);
            NavigateToLoginCommand = new AsyncRelayCommand(NavigateToLoginAsync);
            GoogleSignUpCommand = new AsyncRelayCommand(OnGoogleLoginClicked);
            FacebookSignUpCommand = new AsyncRelayCommand(OnFacebookLoginClicked);
            XSignUpCommand = new AsyncRelayCommand(OnXLoginClicked);
        }

        private async Task OnSignUp()
        {
            // Validation logic
            if (string.IsNullOrWhiteSpace(User.Username) ||
                string.IsNullOrWhiteSpace(User.Email) ||
                string.IsNullOrWhiteSpace(User.Password) ||
                string.IsNullOrWhiteSpace(User.ConfirmPassword))
            {
                Feedback = "All fields are required.";
                FeedbackColor = Colors.Red;
                return;
            }

            if (!IsValidEmail(User.Email))
            {
                Feedback = "Please enter a valid email address.";
                FeedbackColor = Colors.Red;
                return;
            }

            if (User.Password != User.ConfirmPassword)
            {
                Feedback = "Passwords do not match.";
                FeedbackColor = Colors.Red;
                return;
            }

            if (User.Password.Length < 6)
            {
                Feedback = "Password must be at least 6 characters long.";
                FeedbackColor = Colors.Red;
                return;
            }

            if (!HasValidPassword(User.Password))
            {
                Feedback = "Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character.";
                FeedbackColor = Colors.Red;
                return;
            }

            try
            {
                // Reuse the HttpClient
                using (var client = new HttpClient())
                {
                    var requestBody = new StringContent(Newtonsoft.Json.JsonConvert.SerializeObject(new
                    {
                        client_id = "bo8quj1pxMotyK7KPJK1rNi91dg9MhuU", // Consider using a secure method to manage this
                        email = User.Email,
                        password = User.Password,
                        connection = "Username-Password-Authentication",
                        name = User.Username
                    }), System.Text.Encoding.UTF8, "application/json");

                    var response = await client.PostAsync("https://dev-ghzmuldobn03le25.us.auth0.com/dbconnections/signup", requestBody);
                    var content = await response.Content.ReadAsStringAsync();

                    if (response.IsSuccessStatusCode)
                    {
                        FeedbackColor = Colors.Green;
                        Feedback = "Sign-up successful! Please check your email to verify your account.";
                        await Application.Current.MainPage.DisplayAlert("Success", "Sign-up successful! A verification email has been sent.", "OK");
                        await Shell.Current.GoToAsync("//LoginPage");
                    }
                    else
                    {
                        // Extract error details for better debugging
                        var errorResponse = Newtonsoft.Json.JsonConvert.DeserializeObject<Dictionary<string, string>>(content);
                        var errorMessage = errorResponse.ContainsKey("description") ? errorResponse["description"] : "An error occurred.";
                        FeedbackColor = Colors.Red;
                        Feedback = $"Sign-up failed: {errorMessage}";
                        Debug.WriteLine(content); // Log the content for debugging
                    }
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex);
                FeedbackColor = Colors.Red;
                Feedback = $"Sign-up failed: {ex.Message}";
            }

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

        // Method to validate email format
        private bool IsValidEmail(string email)
        {
            try
            {
                var mail = new System.Net.Mail.MailAddress(email);
                return mail.Address == email;
            }
            catch
            {
                return false;
            }
        }

        // Method to check password strength
        private bool HasValidPassword(string password)
        {
            // Check if password has at least one uppercase, one lowercase, one digit, and one special character
            bool hasUpperCase = false;
            bool hasLowerCase = false;
            bool hasDigit = false;
            bool hasSpecialChar = false;

            foreach (char c in password)
            {
                if (char.IsUpper(c)) hasUpperCase = true;
                else if (char.IsLower(c)) hasLowerCase = true;
                else if (char.IsDigit(c)) hasDigit = true;
                else if (!char.IsLetterOrDigit(c)) hasSpecialChar = true;
            }

            return hasUpperCase && hasLowerCase && hasDigit && hasSpecialChar;
        }

        private async Task NavigateToLoginAsync()
        {
            // Navigate to the login page
            await Shell.Current.GoToAsync("//LoginPage");  // Assuming you use Shell navigation
        }
    }
}

