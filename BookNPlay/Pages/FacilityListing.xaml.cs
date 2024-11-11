using System.Linq;
using Microsoft.Maui.Controls;
using System.Collections.ObjectModel;
using BookNPlay.Models;
using BookNPlay.Services;

namespace BookNPlay.Pages
{
    public partial class FacilityListing : ContentPage
    {
        private readonly FacilityService _facilityService;

        public ObservableCollection<FacilityModel> AvailableFacilities { get; set; }
        public ObservableCollection<FacilityModel> NotAvailableFacilities { get; set; }

        public FacilityListing()
        {
            InitializeComponent();
            _facilityService = new FacilityService();

            // Fetch available and not available facilities
            AvailableFacilities = new ObservableCollection<FacilityModel>(
                _facilityService.GetAvailableFacilities());

            NotAvailableFacilities = new ObservableCollection<FacilityModel>(
                _facilityService.Facilities.Where(f => !f.IsAvailable));

            BindingContext = this;
        }

        // Remove OnFacilitySelected method if detail page is not required
    }
}
