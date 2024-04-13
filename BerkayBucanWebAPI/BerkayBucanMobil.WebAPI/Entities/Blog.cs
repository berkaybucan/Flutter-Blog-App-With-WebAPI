using System;
using System.Collections.Generic;

namespace BerkayBucanMobil.WebAPI.Entities;

public partial class Blog
{
    public int BlogId { get; set; }

    public string? BlogBaslik { get; set; }

    public string? BlogOlusturan { get; set; }

    public string? BlogTarih { get; set; }

    public string? BlogKapakUrl { get; set; }

    public string? BlogIcerik { get; set; }
}
