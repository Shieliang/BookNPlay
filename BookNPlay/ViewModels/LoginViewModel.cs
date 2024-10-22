using System;
using System.Diagnostics;
using System.Threading.Tasks;
using System.Windows.Input;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using BookNPlay.Services; // Ensure to import your Firebase service
using Microsoft.Maui.Controls;
using Firebase.Auth;

namespace BookNPlay.ViewModels
{
    public partial class LoginViewModel : ObservableObject
    {
        // Bindable properties for email, password, and feedback messages
        [ObservableProperty]
        private string email;

        [ObservableProperty]
        private string password;

        [ObservableProperty]
        private string feedback;

        [ObservableProperty]
        private Color feedbackColor;

        private readonly FirebaseAuthService authService;

        // Commands for various login-related actions
        public ICommand LoginCommand { get; }
        public ICommand NavigateToSignUpCommand { get; }
        public ICommand ForgotPasswordCommand { get; } // Command for forgot password flow
        public ICommand GoogleLoginCommand { get; }
        public ICommand FacebookLoginCommand { get; }
        public ICommand AppleLoginCommand { get; }

        // Constructor initializes commands and the Firebase service
        public LoginViewModel()
        {
            authService = new FirebaseAuthService(); // Initialize Firebase authentication service
            LoginCommand = new AsyncRelayCommand(OnLogin); // Command for login
            NavigateToSignUpCommand = new AsyncRelayCommand(NavigateToSignUpAsync); // Command to navigate to sign-up page
            ForgotPasswordCommand = new AsyncRelayCommand(OnForgotPasswordTapped); // Forgot password command
            // Initialize social login commands
            GoogleLoginCommand = new AsyncRelayCommand(OnGoogleLoginClicked);
            FacebookLoginCommand = new AsyncRelayCommand(OnFacebookLoginClicked);
            AppleLoginCommand = new AsyncRelayCommand(OnAppleLoginClicked);
        }

        // Login logic
        private async Task OnLogin()
        {
            // Validate email and password
            if (string.IsNullOrWhiteSpace(Email) || string.IsNullOrWhiteSpace(Password))
            {
                Feedback = "Email and Password are required.";
                FeedbackColor = Colors.Red;
                return;
            }

            try
            {
                // Try signing in the user using Firebase authentication service
                var signInResponse = await authService.SignInWithEmailAndPassword(Email, Password);

                // Login success feedback
                FeedbackColor = Colors.Green;
                Feedback = "Login successful!";

                // Navigate to the dashboard page after successful login
                await Shell.Current.GoToAsync("//Dashboard");
            }
            catch (FirebaseAuthException authEx)
            {
                // FirebaseAuth-specific errors (e.g., invalid email, unverified account)
                Debug.WriteLine(authEx);
                FeedbackColor = Colors.Red;
                Feedback = $"Login failed: {authEx.Message}";
            }
            catch (Exception ex)
            {
                // General exception handling for unexpected errors
                Debug.WriteLine(ex);
                FeedbackColor = Colors.Red;
                Feedback = $"An unexpected error occurred: {ex.Message}";
            }
        }

        // Navigation to sign-up page
        private async Task NavigateToSignUpAsync()
        {
            // Navigate to the sign-up page when the sign-up command is invoked
            await Shell.Current.GoToAsync("//SignUpPage");
        }

        // Forgot password functionality (to be implemented)
        private async Task OnForgotPasswordTapped()
        {
            // Navigate to forgot password page or handle forgot password functionality here
            // TODO: Implement forgot password logic
        }

        // Placeholder methods for social login (to be implemented later)
        private async Task OnGoogleLoginClicked()
        {
            // TODO: Implement Google login logic here
        }

        private async Task OnFacebookLoginClicked()
        {
            // TODO: Implement Facebook login logic here
        }

        private async Task OnAppleLoginClicked()
        {
            // TODO: Implement Apple login logic here
        }
    }
}
