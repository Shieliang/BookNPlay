using System;
using Microsoft.Maui.Controls;
using BookNPlay.ViewModels;
using System.Diagnostics;

namespace BookNPlay.Pages
{
    public partial class LoginPage : ContentPage
    {
        private readonly LoginViewModel viewModel;

        public LoginPage(LoginViewModel viewModel)
        {
            InitializeComponent();
            this.viewModel = viewModel; // Assign the parameter to the private field
            BindingContext = this.viewModel; // Set the BindingContext to the ViewModel
        }

        // Event handler for the button tap animation
        private async void OnLoginButtonTapped(object sender, EventArgs e)
        {
            // This method will handle the tap animation
            var button = (Button)sender;
            await button.ScaleTo(0.95, 50);  // Shrink the button slightly
            await button.ScaleTo(1, 50);     // Reset the button size

            // Optionally: You can trigger the actual login logic here, or leave it to your ViewModel
            Debug.WriteLine("Login button tapped!");
        }
    }
}

