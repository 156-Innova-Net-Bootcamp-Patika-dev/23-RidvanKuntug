using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookShopModels.Models
{
    ////*** Genres Table define
    public class Genres
    {
        ////*** Id prop define
        [Key]
        public int GenreId { get; set; }

        [Required]
        public string GenreName { get; set; }
    }
}
