using BookNPlay.ViewModels;

namespace BookNPlay.Pages;

public partial class BookingPage : ContentPage
{
	public BookingPage(BookingViewModel viewModel)
	{
		InitializeComponent();
		BindingContext=viewModel;
		viewModel.LoadBookingTimeSlots();
    }
}