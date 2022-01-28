using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookShopModels.Models
{
    public class BookDetails
    {
        [Key]
        public int BookDetailId { get; set; }

        [Required]
        public int EpisodeCount { get; set; }

        [Required]
        public int PageCount { get; set; }

        [Required]
        public double BookWeight{ get; set; }

        public Books Books { get; set; }
    }
}
