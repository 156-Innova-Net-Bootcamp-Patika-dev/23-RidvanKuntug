using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookShopModels.Models
{
    public class BookWriter
    {
        public int BookId { get; set; }
        public Books Books { get; set; }

        public int WriterId { get; set; }
        public Writers Writers { get; set; }
    }
}
