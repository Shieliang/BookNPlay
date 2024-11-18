using BookNPlay.ViewModels;

namespace BookNPlay.Pages;

public partial class FacilityListingPage : ContentPage
{

    private readonly FacilityListingViewModel viewModel;
    public FacilityListingPage()
    {
        InitializeComponent();
        viewModel = new FacilityListingViewModel();  // Initialize the viewModel
        BindingContext = viewModel;  // Assign the viewModel to the BindingContext
        viewModel.LoadFacilitiesCommand.Execute(null);
    }
}