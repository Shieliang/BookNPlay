using System;
using Microsoft.Maui.Controls;
using BookNPlay.ViewModels;
using System.Diagnostics;

namespace BookNPlay.Pages
{
    public partial class LoginPage : ContentPage
    {
        private LoginViewModel viewModel;
        public LoginPage()
        {
            InitializeComponent();
            viewModel = new LoginViewModel();
            BindingContext = viewModel;
        }

       
    }
}
