using Auth0.OidcClient;
using Microsoft.Extensions.Logging;
using BookNPlay.Pages;
using BookNPlay.ViewModels;

namespace BookNPlay
{
    public static class MauiProgram
    {
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

#if DEBUG
    		builder.Logging.AddDebug();
#endif
            builder.Services.AddSingleton<IConnectivity>(Connectivity.Current)
            .AddSingleton<LoginViewModel>()
            .AddSingleton<LoginPage>()
            .AddSingleton<SignUpPage>()
            .AddSingleton<SignUpViewModel>()
            .AddSingleton<Dashboard>()
            .AddSingleton<DashboardViewModel>()
            .AddSingleton<FacilityListingPage>()
            .AddSingleton<FacilityListingViewModel>()
            .AddSingleton<BookingTrackerPage>()
            .AddSingleton<BookingTrackerViewModel>()
            .AddSingleton<ResetPasswordPage>()
            .AddSingleton<ResetPasswordViewModel>();

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
}
