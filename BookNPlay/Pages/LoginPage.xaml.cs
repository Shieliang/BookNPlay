using System.Diagnostics;
using Auth0.OidcClient;
using BookNPlay.ViewModels;

namespace BookNPlay.Pages;

public partial class LoginPage : ContentPage
{
	public LoginPage(LoginViewModel viewModel)
	{
		InitializeComponent();
        BindingContext = viewModel;
    }

    protected override void OnDisappearing()
    {
        base.OnDisappearing();

        // Resetting feedback label when the page disappears (logout or navigation)
        FeedbackLabel.Text = string.Empty;
    }


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