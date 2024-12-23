using BookNPlay.ViewModels;
namespace BookNPlay.Pages;

public partial class Dashboard : ContentPage
{
	public Dashboard(DashboardViewModel viewModel)
	{
		InitializeComponent();
        BindingContext = viewModel;
    }
}