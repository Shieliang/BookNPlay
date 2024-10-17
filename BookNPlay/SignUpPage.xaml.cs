namespace BookNPlay;

public partial class SignUpPage : ContentPage
{
	public SignUpPage()
	{
		InitializeComponent();
	}

    // Event handler for SignUp Button click
    private async void OnSignUpClicked(object sender, EventArgs e)
    {
        string fullName = UsernameEntry.Text;
        string email = EmailEntry.Text;
        string password = PasswordEntry.Text;
        string confirmPassword = ConfirmPasswordEntry.Text;

        // Basic validation
        if (string.IsNullOrWhiteSpace(fullName) || string.IsNullOrWhiteSpace(email) ||
            string.IsNullOrWhiteSpace(password) || string.IsNullOrWhiteSpace(confirmPassword))
        {
            FeedbackLabel.Text = "All fields are required.";
            return;
        }

        if (password != confirmPassword)
        {
            FeedbackLabel.Text = "Passwords do not match.";
            return;
        }

        // Password length validation
        if (password.Length < 6)
        {
            FeedbackLabel.Text = "Password must be at least 6 characters long.";
            return;
        }

        // You can add more validations (e.g., email format) if needed

        // If all validations pass, simulate sign-up process
        try
        {
            // Simulate a sign-up process (here, it could be saving data to a database or API call)
            FeedbackLabel.TextColor = Colors.Green;
            FeedbackLabel.Text = "Sign-up successful!";

            // Navigate to the login page or another page
            await Navigation.PushAsync(new LoginPage());
        }
        catch (Exception ex)
        {
            // If something went wrong during the sign-up process
            FeedbackLabel.TextColor = Colors.Red;
            FeedbackLabel.Text = $"Sign-up failed: {ex.Message}";
        }
    }

    // Event handler for navigating back to Login Page
    private async void OnLoginTapped(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new LoginPage());
    }
}