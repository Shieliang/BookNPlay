using System.Collections.ObjectModel;
using Microsoft.Maui.Controls;
using BookNPlay.Services;
using BookNPlay.Models;
using System.ComponentModel;

namespace BookNPlay.Pages
{
    public partial class FacilityListing : ContentPage, INotifyPropertyChanged
    {
        private FacilityService facilityService;
        private ObservableCollection<FacilityModel> availableFacilities;
        private ObservableCollection<FacilityModel> notAvailableFacilities;

        public ObservableCollection<FacilityModel> AvailableFacilities
        {
            get => availableFacilities;
            set
            {
                availableFacilities = value;
                OnPropertyChanged(nameof(AvailableFacilities));
            }
        }

        public ObservableCollection<FacilityModel> NotAvailableFacilities
        {
            get => notAvailableFacilities;
            set
            {
                notAvailableFacilities = value;
                OnPropertyChanged(nameof(NotAvailableFacilities));
            }
        }

        public FacilityListing()
        {
            InitializeComponent();
            facilityService = new FacilityService();
            LoadFacilities();
            BindingContext = this;
        }

        private void LoadFacilities()
        {
            AvailableFacilities = facilityService.GetAvailableFacilities();
            NotAvailableFacilities = facilityService.GetNotAvailableFacilities();
        }

        private void OnSearchTextChanged(object sender, TextChangedEventArgs e)
        {
            string searchText = e.NewTextValue?.ToLower() ?? string.Empty;

            if (string.IsNullOrEmpty(searchText))
            {
                LoadFacilities();
            }
            else
            {
                AvailableFacilities = facilityService.SearchFacilities(searchText, true);
                NotAvailableFacilities = facilityService.SearchFacilities(searchText, false);
            }
        }
    }
}