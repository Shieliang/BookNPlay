using BookNPlay.ViewModels;
using System.Diagnostics;

namespace BookNPlay.Pages;

public partial class ResetPasswordPage : ContentPage
{
	public ResetPasswordPage(ResetPasswordViewModel viewModel)
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

}
