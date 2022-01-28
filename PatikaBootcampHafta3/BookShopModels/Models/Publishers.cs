using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookShopModels.Models
{
    ////*** Publishers Table define
    public class Publishers
    {
        ////*** Id prop define
        [Key]
        public int PublisherId { get; set; }

        ////*** Defining required
        [Required]
        public string PublisherName { get; set; }

        [Required]
        public string PublisherLocation { get; set; }

        public List<Books> Books { get; set; }

    }
}
