using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SiteManagementApplication.Operations.UserOperations.Commands.AddUser
{
    public class AddUserModel
    {
        public string UserName { get; set; }
        public string UserFullName { get; set; }
        public long UserTc { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string PasswordHash { get; set; }
        public string UserVehicle { get; set; }
        public bool IsAdmin { get; set; } = false;
    }
}
