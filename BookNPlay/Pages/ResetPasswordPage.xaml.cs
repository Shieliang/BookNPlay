using BookNPlay.ViewModels;
using System.Diagnostics;

namespace BookNPlay.Pages;

public partial class ResetPasswordPage : ContentPage
{
	public ResetPasswordPage(ResetPasswordViewModel viewModel)
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
}
