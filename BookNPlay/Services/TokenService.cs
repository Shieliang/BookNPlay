using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookNPlay.Services
{
    public class TokenService
    {
        private const string TokenKey = "user_token";

        public void StoreToken(string token)
        {
            Preferences.Set(TokenKey, token); // Ensure to import Xamarin.Essentials
        }

        public string RetrieveToken()
        {
            return Preferences.Get(TokenKey, string.Empty);
        }

        public void ClearToken()
        {
            Preferences.Remove(TokenKey);
        }
    }

}
