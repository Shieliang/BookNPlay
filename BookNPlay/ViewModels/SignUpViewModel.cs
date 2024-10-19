using System;
using System.Windows.Input;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.Maui.Controls;
using BookNPlay.Models;
using Firebase.Auth;

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
            // Validation logic
            if (string.IsNullOrWhiteSpace(User.Username) || string.IsNullOrWhiteSpace(User.Email) ||
                string.IsNullOrWhiteSpace(User.Password) || string.IsNullOrWhiteSpace(User.ConfirmPassword))
            {
                Feedback = "All fields are required.";
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

            // Simulate sign-up process
            try
            {
                FeedbackColor = Colors.Green;
                Feedback = "Sign-up successful!";
                await Shell.Current.GoToAsync(".."); // Adjust based on your navigation setup
            }
            catch (Exception ex)
            {
                FeedbackColor = Colors.Red;
                Feedback = $"Sign-up failed: {ex.Message}";
            }
        }

        private async Task NavigateToLoginAsync()
        {
            // Navigate to the login page
            await Shell.Current.GoToAsync("//LoginPage");  // Assuming you use Shell navigation
        }
    }
}

