using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookNPlay.Services
{
    public class FirebaseAuthService
    {
        private const string FirebaseAuthUrl = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCwIbdvQceBlvfXzHggcy3WOnQcojyQdWA";
        private const string FirebaseEmailVerificationUrl = "https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=AIzaSyCwIbdvQceBlvfXzHggcy3WOnQcojyQdWA";

        private readonly HttpClient _httpClient;

        public FirebaseAuthService()
        {
            _httpClient = new HttpClient();
        }

        // Sign up new user
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

            // Optionally, handle the response if needed
            var responseBody = await response.Content.ReadAsStringAsync();
            Console.WriteLine("Email verification link sent: " + responseBody);
        }

        
        public async Task<string> SignInWithEmailAndPassword(string email, string password)
        {
            var signInUrl = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCwIbdvQceBlvfXzHggcy3WOnQcojyQdWA"; // Replace with your API key

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
            return responseBodySuccess; // This contains the user's token and other info
        }

    }

}
