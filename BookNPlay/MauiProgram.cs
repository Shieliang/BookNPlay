using BookNPlay.Services;
using BookNPlay.ViewModels;
using Auth0;
using Auth0.OidcClient;
using BookNPlay.Pages;

namespace BookNPlay;

public static class MauiProgram
{
    public static class Constants
    {

        public const string BaseUrl = "https://mysite/mobileauth/";
        public const string CallbackScheme = "myapp://";
    }
    public static MauiApp CreateMauiApp()
	{
		var builder = MauiApp.CreateBuilder();
		builder
			.UseMauiApp<App>()
			.ConfigureFonts(fonts =>
			{
				fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
				fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
            });
        builder.Services.AddSingleton<IConnectivity>(Connectivity.Current)
        .AddSingleton<LoginViewModel>()
        .AddSingleton<SignUpViewModel>()
        .AddSingleton<DashboardViewModel>()
        .AddSingleton<DashboardViewModel>()
        .AddSingleton<SignUpViewModel>()
        .AddSingleton<FacilityListingViewModel>()
        .AddSingleton<LoginPage>()
        .AddSingleton<SignUpPage>()
        .AddSingleton<FacilityListing>()
        .AddSingleton<Dashboard>()
        .AddSingleton<FacilityListingPage>();

        builder.Services.AddSingleton(new Auth0Client(new()
        {
            Domain = "dev-ghzmuldobn03le25.us.auth0.com",
            ClientId = "bo8quj1pxMotyK7KPJK1rNi91dg9MhuU",
            RedirectUri = "myapp://callback/",
            PostLogoutRedirectUri = "myapp://callback/",
            Scope = "openid profile email"
        }));

        return builder.Build();
        
	}
}
