using System.ComponentModel.DataAnnotations;

namespace BookShopModels.Models
{
    ////*** Categories Table define
    public class Categories
    {
        ////*** Id prop define
        [Key]
        public int CategoryId { get; set; }

        [Required]
        public string CategoryName { get; set; }
        
    }
}
