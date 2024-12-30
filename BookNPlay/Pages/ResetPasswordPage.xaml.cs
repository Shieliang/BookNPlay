using System.Diagnostics;

namespace BookNPlay.Pages;

public partial class ResetPasswordPage : ContentPage
{
	public ResetPasswordPage()
	{
		InitializeComponent();
	}

    protected override async void OnAppearing()
    {
        base.OnAppearing();

        // Resetting specific UI elements directly
        FeedbackLabel.Text = string.Empty; // Assuming FeedbackLabel is your Label

        // Debugging to check if OnAppearing is called
        Debug.WriteLine("LoginPage Appearing");

       

    }

    
}
