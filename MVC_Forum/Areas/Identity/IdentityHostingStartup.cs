using System;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using TP2_Mathieu_Blackburn_Rogers.Data;

[assembly: HostingStartup(typeof(TP2_Mathieu_Blackburn_Rogers.Areas.Identity.IdentityHostingStartup))]
namespace TP2_Mathieu_Blackburn_Rogers.Areas.Identity
{
    public class IdentityHostingStartup : IHostingStartup
    {
        public void Configure(IWebHostBuilder builder)
        {
            builder.ConfigureServices((context, services) => {
            });
        }
    }
}