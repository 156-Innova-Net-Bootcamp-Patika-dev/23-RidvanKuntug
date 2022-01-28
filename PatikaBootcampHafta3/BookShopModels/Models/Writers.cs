using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookShopModels.Models
{
    ////*** Writers Table define
    public class Writers
    {
        ////*** Id prop define
        [Key]
        public int WriterId { get; set; }

        ////*** Defining required
        [Required]
        public string WriterName { get; set; }

        [Required]
        public string WriterSurname { get; set; }

        [Required]
        public DateTime WriterBornDate { get; set; }

        public ICollection<BookWriter> BooksWriters { get; set; }

        ////*** We specify that it will not be added to the database
        [NotMapped]
        public string WriterFullName
        {
            get { return $"{WriterName} {WriterSurname}"; }
        }
    }
}
