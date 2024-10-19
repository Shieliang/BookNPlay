namespace BookNPlay.Pages;

public partial class SignUpPage : ContentPage
{
	public SignUpPage()
	{
		InitializeComponent();
		BindingContext = new BookNPlay.ViewModels.SignUpViewModel();
	}

}