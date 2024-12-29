namespace BookNPlay.Pages;

using System.Diagnostics;
using BookNPlay.ViewModels;

public partial class SignUpPage : ContentPage
{
	public SignUpPage(SignUpViewModel viewModel)
	{
		InitializeComponent();
		BindingContext = viewModel;
        FeedbackLabel.Text = string.Empty; // Assuming FeedbackLabel is your Label
    }

    protected override async void OnAppearing()
    {
        base.OnAppearing();

        // Resetting specific UI elements directly
        FeedbackLabel.Text = string.Empty; // Assuming FeedbackLabel is your Label

        // Debugging to check if OnAppearing is called
        Debug.WriteLine("LoginPage Appearing");

        // Perform the logo animation here
        await AnimateLogo();

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