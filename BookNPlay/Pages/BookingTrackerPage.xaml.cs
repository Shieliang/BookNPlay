using BookNPlay.ViewModels;
namespace BookNPlay.Pages;

public partial class BookingTrackerPage : ContentPage
{
    private readonly BookingTrackerViewModel _viewModel;
    public BookingTrackerPage(BookingTrackerViewModel viewModel)
	{
		InitializeComponent();
        _viewModel = viewModel;
		BindingContext = _viewModel;
        
    }
    protected override async void OnAppearing()
    {
        base.OnAppearing();

        if (_viewModel != null)
        {
            await _viewModel.LoadBookings();
        }
    }
}