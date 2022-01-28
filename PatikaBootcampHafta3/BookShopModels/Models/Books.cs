using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookShopModels.Models
{
    ////*** Books Table define
    public class Books
    {
        ////*** Id prop define
        [Key]
        public int BookId { get; set; }

        ////*** Defining required
        [Required]
        public string BookName { get; set; }

        [Required]
        public double BookPrice { get; set; }

        [Required]
        [StringLength(13)]
        public string ISBN { get; set; }

        //[ForeignKey("Genres")]
        //public int GenreId { get; set; }
        //public Genres Genres { get; set; }

        [ForeignKey("BookDetails")]
        public int BookDetails_Id { get; set; }
        public BookDetails BookDetails { get; set; }

        [ForeignKey("Publishers")]
        public int PublisherId { get; set; }
        public Publishers Publishers { get; set; }

        public ICollection<BookWriter> BooksWriters { get; set; }


        [NotMapped]
        public int? BookDiscountedPrice { get; set; }

    }
}
