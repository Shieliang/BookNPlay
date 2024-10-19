namespace BookNPlay.Pages;

public partial class SignUpPage : ContentPage
{
	public SignUpPage()
	{
		InitializeComponent();
		BindingContext = new ViewModels.SignUpViewModel();
	}

}