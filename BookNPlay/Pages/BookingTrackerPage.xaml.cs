using BookNPlay.ViewModels;
namespace BookNPlay.Pages;

public partial class BookingTrackerPage : ContentPage
{
	public BookingTrackerPage(BookingTrackerViewModel viewModel)
	{
		InitializeComponent();
		BindingContext = viewModel;
        viewModel.LoadBookings();
    }
}