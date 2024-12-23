namespace BookNPlay.Pages;
using BookNPlay.ViewModels;

public partial class SignUpPage : ContentPage
{
	public SignUpPage(SignUpViewModel viewModel)
	{
		InitializeComponent();
		BindingContext = viewModel;
	}
}