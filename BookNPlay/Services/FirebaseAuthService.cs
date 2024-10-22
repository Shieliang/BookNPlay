using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace BookNPlay.Services
{
    public class FirebaseAuthService
    {
        private const string FirebaseAuthUrl = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCwIbdvQceBlvfXzHggcy3WOnQcojyQdWA";
        private const string FirebaseEmailVerificationUrl = "https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=AIzaSyCwIbdvQceBlvfXzHggcy3WOnQcojyQdWA";
        private const string FirebaseSignInUrl = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCwIbdvQceBlvfXzHggcy3WOnQcojyQdWA";

        private readonly HttpClient _httpClient;

        public FirebaseAuthService()
        {
            _httpClient = new HttpClient();
        }

        // Sign up a new user
        public async Task<string> SignUpWithEmailAndPassword(string email, string password)
        {
            var requestBody = new
            {
                email,
                password,
                returnSecureToken = true
            };

            var json = JsonConvert.SerializeObject(requestBody);
            var content = new StringContent(json, Encoding.UTF8, "application/json");

            var response = await _httpClient.PostAsync(FirebaseAuthUrl, content);

            if (!response.IsSuccessStatusCode)
            {
                var responseBody = await response.Content.ReadAsStringAsync();
                throw new Exception($"Error: {response.StatusCode}, Details: {responseBody}");
            }

            var responseBodySuccess = await response.Content.ReadAsStringAsync();
            return responseBodySuccess; // This contains the user's token and other info
        }

        // Send email verification link
        public async Task SendEmailVerificationLink(string idToken)
        {
            var requestBody = new
            {
                requestType = "VERIFY_EMAIL",
                idToken
            };

            var json = JsonConvert.SerializeObject(requestBody);
            var content = new StringContent(json, Encoding.UTF8, "application/json");

            var response = await _httpClient.PostAsync(FirebaseEmailVerificationUrl, content);
            response.EnsureSuccessStatusCode();

            var responseBody = await response.Content.ReadAsStringAsync();
            Console.WriteLine("Email verification link sent: " + responseBody);
        }

        // Sign in with email and password
        public async Task<string> SignInWithEmailAndPassword(string email, string password)
        {
            var signInUrl = FirebaseSignInUrl;

            var requestBody = new
            {
                email,
                password,
                returnSecureToken = true
            };

            var json = JsonConvert.SerializeObject(requestBody);
            var content = new StringContent(json, Encoding.UTF8, "application/json");

            var response = await _httpClient.PostAsync(signInUrl, content);

            if (!response.IsSuccessStatusCode)
            {
                var responseBody = await response.Content.ReadAsStringAsync();
                throw new Exception($"Error: {response.StatusCode}, Details: {responseBody}");
            }

            var responseBodySuccess = await response.Content.ReadAsStringAsync();
            var responseData = JsonConvert.DeserializeObject<Dictionary<string, object>>(responseBodySuccess);

            // Extract ID token for verifying email
            if (responseData.TryGetValue("idToken", out var idToken))
            {
                // Check email verification status
                var emailVerified = await IsEmailVerified(idToken.ToString());
                if (!emailVerified)
                {
                    throw new Exception("Email not verified. Please verify your email before signing in.");
                }
            }

            return responseBodySuccess; // This contains the user's token and other info
        }

        // Method to check if the email is verified
        private async Task<bool> IsEmailVerified(string idToken)
        {
            var getAccountInfoUrl = $"https://identitytoolkit.googleapis.com/v1/accounts:lookup?key=AIzaSyCwIbdvQceBlvfXzHggcy3WOnQcojyQdWA";

            var requestBody = new
            {
                idToken
            };

            var json = JsonConvert.SerializeObject(requestBody);
            var content = new StringContent(json, Encoding.UTF8, "application/json");

            var response = await _httpClient.PostAsync(getAccountInfoUrl, content);

            if (!response.IsSuccessStatusCode)
            {
                var responseBody = await response.Content.ReadAsStringAsync();
                throw new Exception($"Error fetching account info: {response.StatusCode}, Details: {responseBody}");
            }

            var responseBodySuccess = await response.Content.ReadAsStringAsync();
            var accountInfo = JsonConvert.DeserializeObject<Dictionary<string, object>>(responseBodySuccess);

            if (accountInfo.ContainsKey("users"))
            {
                var users = accountInfo["users"] as Newtonsoft.Json.Linq.JArray;
                if (users != null && users.Count > 0)
                {
                    var user = users[0] as Newtonsoft.Json.Linq.JObject;
                    if (user.ContainsKey("emailVerified"))
                    {
                        return (bool)user["emailVerified"];
                    }
                }
            }

            return false;
        }

        public Task Logout()
        {
            // For now, we clear any stored token or session info.
            // If you're storing tokens in local storage or preferences, clear them here.
            // Example if using Preferences:
            Preferences.Remove("user_token");

            // If needed, do any additional cleanup.
            return Task.CompletedTask;
        }

    }
}
