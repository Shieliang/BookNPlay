

namespace BookNPlay.Pages;

public partial class Dashboard : ContentPage
{
    
    public Dashboard()
    {
		InitializeComponent();
        
    }

    private async void OnLogoutClicked(object sender, EventArgs e)
    {
        // Perform your logout logic here, e.g., clearing user session

        // Navigate back to the LoginPage
        await Shell.Current.GoToAsync("LoginPage");
    }
}

