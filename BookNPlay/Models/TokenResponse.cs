using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookNPlay.Models
{
    public class TokenResponse
    {
        public string Access_Token { get; set; }
        public string Id_Token { get; set; }
        public string Scope { get; set; }  // Add this to match the response
        public int Expires_In { get; set; }
        public string Token_Type { get; set; }
    }
}
