using System;
using Microsoft.Maui.Controls;

namespace BookNPlay.Pages
{
    public partial class LoginPage : ContentPage
    {
        public LoginPage()
        {
            InitializeComponent();
        }

        // Handle login button click
        private void OnLoginClicked(object sender, EventArgs e)
        {
            string username = EmailEntry.Text;
            string password = PasswordEntry.Text;

            // Simple validation logic
            if (username == "admin" && password == "password123")
            {
                FeedbackLabel.Text = "Login successful!";
                FeedbackLabel.TextColor = Colors.Green;
            }
            else
            {
                FeedbackLabel.Text = "Invalid username or password.";
                FeedbackLabel.TextColor = Colors.Red;
            }
        }

        // Handle forgot password tap
        private void OnForgotPasswordTapped(object sender, EventArgs e)
        {
            // Leave this empty as requested for now
        }

        // Handle sign up button click
        private void OnSignUpClicked(object sender, EventArgs e)
        {
            // Navigate to sign up page or trigger sign-up logic
            Navigation.PushAsync(new SignUpPage()); // Example navigation
        }

        // Handle Google login click
        private void OnGoogleLoginClicked(object sender, EventArgs e)
        {
            // Implement Google login logic here
        }

        // Handle Facebook login click
        private void OnFacebookLoginClicked(object sender, EventArgs e)
        {
            // Implement Facebook login logic here
        }

        // Handle Apple login click
        private void OnAppleLoginClicked(object sender, EventArgs e)
        {
            // Implement Apple login logic here
        }
    }
}
