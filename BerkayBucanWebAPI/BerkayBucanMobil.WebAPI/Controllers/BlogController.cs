using BerkayBucanMobil.WebAPI.Data;
using BerkayBucanMobil.WebAPI.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BerkayBucanMobil.WebAPI.Controllers
{
    public class BlogController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public IActionResult Listele()
        {
            BlogDbContext db = new BlogDbContext();
            List<Blog> liste = db.Blogs.ToList();
            return Json(liste);
        }
        [HttpPost]
        public IActionResult Ekle([FromBody] Blog blg)
        {
            if (blg == null)
            {
                return BadRequest("Body null olamaz");
            }
            BlogDbContext db = new BlogDbContext();
            db.Blogs.Add(blg);
            db.SaveChanges();
            return Ok();
        }
        [HttpPost]
        public IActionResult Guncelle([FromBody] Blog blg)
        {
            if (blg == null)
            {
                return BadRequest("Body null olamaz");
            }
            BlogDbContext db = new BlogDbContext();
            db.Blogs.Update(blg);
            db.SaveChanges();
            return Ok();
        }
        [HttpPost]
        public async Task<IActionResult> Sil([FromBody] Blog blg)
        {
            if (blg == null)
            {
                return BadRequest("Body null olamaz");
            }
            BlogDbContext db = new BlogDbContext();
            db.Blogs.Remove(blg);
            db.SaveChanges();
            return Ok();
        }
    }
}
