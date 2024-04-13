var builder = WebApplication.CreateBuilder(args);
builder.Services.AddMvc();
builder.WebHost.UseUrls("http://192.168.56.1:7246");
var app = builder.Build();

app.MapControllerRoute("main", "{controller=Blog}/{action=Index}/{id?}");

app.Run();
