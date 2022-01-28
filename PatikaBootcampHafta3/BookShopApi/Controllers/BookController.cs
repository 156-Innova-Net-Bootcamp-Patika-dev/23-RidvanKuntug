using BookShopDataAccess.Data;
using BookShopModels.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;

namespace BookShopApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class BookController : Controller
    {
        private readonly ApplicationDbContext _dataBase;
        public BookController(ApplicationDbContext dataBase)
        {
            _dataBase = dataBase;
        }

        [HttpGet]
        public IActionResult Get()
        {
            var categories = _dataBase.Categories.OrderBy(x => x.CategoryId).ToList<Categories>();
            return Ok(categories);
        }

        // GET: BookController/Details/5
        [HttpGet("{id}")]
        public IActionResult Details(int id)
        {
            var categories = _dataBase.Categories.Where(ca => ca.CategoryId == id).SingleOrDefault();

            if (categories is null)
            {
                return BadRequest();
            }
            else
            {
                return Ok(categories);
            }
        }

        [HttpPost]
        public IActionResult AddCategory([FromBody] Categories newCategory)
        {
            var category = _dataBase.Categories.SingleOrDefault(x => x.CategoryName == newCategory.CategoryName);
            category = newCategory;

            _dataBase.Categories.Add(category);
            _dataBase.SaveChanges();

            return Ok(category);
        }

        [HttpPut("{id}")]
        public IActionResult UpdateCategory(int id, [FromBody] Categories changeCategory)
        {
            var category = _dataBase.Categories.SingleOrDefault(x => x.CategoryId == id);

            if (category is null)
            {
                return BadRequest("Kitap mevcut değil.");
            }
            else
            {
                category.CategoryName = changeCategory.CategoryName;
                _dataBase.SaveChanges();
                return Ok(category);
            }
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteCategory(int id)
        {

            var category = _dataBase.Categories.SingleOrDefault(xcategory => xcategory.CategoryId == id);

            if (category is null)
            {
                return BadRequest("Kitap mevcut değil.");
            }
            else
            {
                _dataBase.Categories.Remove(category);
                _dataBase.SaveChanges();
                return Ok(category);
            }
        }

    }
}
