using System;
using System.Windows.Input;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.Maui.Controls;
using BookNPlay.Models;
using Firebase.Auth;
using System.Diagnostics;
using BookNPlay.Services;
using Newtonsoft.Json;

namespace BookNPlay.ViewModels
{
    public partial class SignUpViewModel : ObservableObject
    {
        private SignUpModel user;

        public SignUpModel User
        {
            get => user ??= new SignUpModel();
            set => SetProperty(ref user, value);
        }

        [ObservableProperty]
        private string feedback;

        [ObservableProperty]
        private Color feedbackColor;

        public ICommand SignUpCommand { get; }
        public ICommand NavigateToLoginCommand { get; }

        public SignUpViewModel()
        {
            SignUpCommand = new RelayCommand(OnSignUp);
            NavigateToLoginCommand = new AsyncRelayCommand(NavigateToLoginAsync);
        }

        private async void OnSignUp()
        {
            var authService = new FirebaseAuthService();

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

            // Attempt to sign up the user
            try
            {
                // Sign up the user
                var signupResponse = await authService.SignUpWithEmailAndPassword(User.Email, User.Password);

                // Extract the ID token from the response
                var token = ExtractIdToken(signupResponse);

                // Send email verification link
                await authService.SendEmailVerificationLink(token);

                // Show alert dialog
                await Application.Current.MainPage.DisplayAlert("Success", "Sign-up successful! A verification email has been sent.", "OK");

                await Shell.Current.GoToAsync("//LoginPage"); // Adjust based on your navigation setup
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex);
                FeedbackColor = Colors.Red;
                Feedback = $"Sign-up failed: {ex.Message}";
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


        // Helper method to extract ID token from the signup response
        private string ExtractIdToken(string signupResponse)
        {
            var jsonResponse = JsonConvert.DeserializeObject<Dictionary<string, object>>(signupResponse);
            if (jsonResponse != null && jsonResponse.TryGetValue("idToken", out var idToken))
            {
                return idToken.ToString();
            }
            throw new Exception("ID token not found in signup response.");
        }


        private async Task NavigateToLoginAsync()
        {
            // Navigate to the login page
            await Shell.Current.GoToAsync("//LoginPage");  // Assuming you use Shell navigation
        }
    }
}

