using Firebase.Auth;
using Firebase.Auth.Providers;

namespace BookNPlay;

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

		builder.Services.AddSingleton(new FirebaseAuthClient(new FirebaseAuthConfig()
		{
			ApiKey = "AIzaSyCwIbdvQceBlvfXzHggcy3WOnQcojyQdWA",
			AuthDomain = "booknplay-88fd2.firebaseapp.com",
            Providers = new FirebaseAuthProvider[] 
			{
				new EmailProvider()
			}
		}));

		return builder.Build();
	}
}
