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
        [ObservableProperty]
        private string email;

        [ObservableProperty]
        private string password;

        [ObservableProperty]
        private string feedback;

        [ObservableProperty]
        private Color feedbackColor;

        private readonly FirebaseAuthService authService;

        public ICommand LoginCommand { get; }
        public ICommand NavigateToSignUpCommand { get; }
        public ICommand ForgotPasswordCommand { get; } // Added ForgotPasswordCommand
        public ICommand GoogleLoginCommand { get; }
        public ICommand FacebookLoginCommand { get; }
        public ICommand AppleLoginCommand { get; }

        public LoginViewModel()
        {
            authService = new FirebaseAuthService(); // Initialize once
            LoginCommand = new AsyncRelayCommand(OnLogin);
            NavigateToSignUpCommand = new AsyncRelayCommand(NavigateToSignUpAsync);
            ForgotPasswordCommand = new AsyncRelayCommand(OnForgotPasswordTapped);
            // Initialize social login commands
            GoogleLoginCommand = new AsyncRelayCommand(OnGoogleLoginClicked);
            FacebookLoginCommand = new AsyncRelayCommand(OnFacebookLoginClicked);
            AppleLoginCommand = new AsyncRelayCommand(OnAppleLoginClicked);
        }

        private async Task OnLogin()
        {
            // Validation logic
            if (string.IsNullOrWhiteSpace(Email) || string.IsNullOrWhiteSpace(Password))
            {
                Feedback = "Email and Password are required.";
                FeedbackColor = Colors.Red;
                return;
            }

            // Attempt to log in the user
            try
            {
                var signInResponse = await authService.SignInWithEmailAndPassword(Email, Password);

                // Handle successful login (e.g., navigate to the main page)
                FeedbackColor = Colors.Green;
                Feedback = "Login successful!";
                await Shell.Current.GoToAsync("//Dashboard"); // Adjust based on your navigation setup
            }
            catch (FirebaseAuthException authEx)
            {
                Debug.WriteLine(authEx);
                FeedbackColor = Colors.Red;
                Feedback = $"Login failed: {authEx.Message}";
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex);
                FeedbackColor = Colors.Red;
                Feedback = "An unexpected error occurred.";
            }
        }

        private async Task NavigateToSignUpAsync()
        {
            // Navigate to the sign-up page
            await Shell.Current.GoToAsync("//SignUpPage"); // Adjust based on your navigation setup
        }

        private async Task OnForgotPasswordTapped()
        {
            // Navigate to the forgot password page
            
        }

        // Placeholder methods for social logins
        private async Task OnGoogleLoginClicked()
        {
            // TODO: Implement Google login
        }

        private async Task OnFacebookLoginClicked()
        {
            // TODO: Implement Facebook login
        }

        private async Task OnAppleLoginClicked()
        {
            // TODO: Implement Apple login
        }
    }
}
