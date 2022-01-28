using BookShopDataAccess.Data;
using BookShopModels.Models;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;

namespace BookShop.Controllers
{
    public class CategoriesController : Controller
    {
        private readonly ApplicationDbContext _dataBase;
        public CategoriesController(ApplicationDbContext dataBase)
        {
            _dataBase = dataBase;
        }
        public IActionResult Index()
        {
            List<Categories> categoriesList = _dataBase.Categories.ToList();
            return View(categoriesList);
        }

        public IActionResult UpdateInsert(int? id)
        {
            Categories categories = new Categories();

            if (id == null)
            {
                return View(categories);
            }

            categories = _dataBase.Categories.FirstOrDefault(ca => ca.CategoryId == id);

            if (categories == null)
            {
                return NotFound();
            }
            return View(categories);
        }
    }
}
