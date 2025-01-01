using BookNPlay.ViewModels;

namespace BookNPlay.Pages;

public partial class FacilityListingPage : ContentPage
{
	public FacilityListingPage(FacilityListingViewModel viewModel)
	{
		InitializeComponent();
		BindingContext = viewModel;
	}
}