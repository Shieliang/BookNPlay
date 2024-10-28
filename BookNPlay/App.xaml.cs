namespace BookNPlay;

public partial class App : Application
{
    public App()
    {
        InitializeComponent();

        MainPage = new AppShell();

        // Navigate to the LoginPage when the app starts
        Shell.Current.GoToAsync("//LoginPage");
    }
}