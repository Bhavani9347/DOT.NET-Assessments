using Microsoft.EntityFrameworkCore;
using AirlinesTravelAgency.Data;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorPages();
//Adding services using Dependency Injections
builder.Services.AddDbContext<AirlinesTravelAgencyContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DbAirlinesConnection") ?? throw new InvalidOperationException("Connection string 'DbAirlinesConnection' not found.")));



var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapRazorPages();

app.Run();
