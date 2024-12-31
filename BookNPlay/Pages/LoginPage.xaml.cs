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
        AnimateLogo();
    }

    protected override async void OnDisappearing()
    {
        base.OnDisappearing();

        // Resetting feedback label when the page disappears (logout or navigation)
        FeedbackLabel.Text = string.Empty;
    
    }

    private async Task AnimateLogo()
    {
        // Check if LogoImage is not null to avoid null reference errors
        if (LogoImage != null)
        {
            // Debugging to confirm the LogoImage exists
            Debug.WriteLine("Animating LogoImage");

            // Continuously animate the logo
            while (true)
            {
                // Scale up the logo to 1.2x in 1 second (1000 milliseconds)
                await LogoImage.ScaleTo(1.2, 1000, Easing.CubicInOut);

                // Scale the logo back down to 1x in 1 second
                await LogoImage.ScaleTo(1, 1000, Easing.CubicInOut);
            }
        }
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