using BookNPlay.ViewModels;

namespace BookNPlay.Pages
{

    public partial class BookingPage : ContentPage
    {
        public BookingPage(BookingViewModel viewModel)
        {
            InitializeComponent();
            BindingContext = viewModel;
        }

        // Default parameterless constructor (for Shell navigation)
        public BookingPage() : this(new BookingViewModel()) { }
    }
}
