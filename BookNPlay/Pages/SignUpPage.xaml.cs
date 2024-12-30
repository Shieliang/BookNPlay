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

        

    }

    
}