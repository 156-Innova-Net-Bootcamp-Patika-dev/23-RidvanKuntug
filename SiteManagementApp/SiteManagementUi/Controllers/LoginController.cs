using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SiteManagementUi.Entities;
using SiteManagementUi.Models;
using SiteManagementUi.Services;

namespace SiteManagementUi.Controllers
{
    public class LoginController : Controller
    {

        // GET: LoginController/Details/5
        public ActionResult GetLogin(string UserName, string Password)
        {
            LoginToken bag = new LoginToken();
            bag = UserService.GetLoginToken(UserName, Password);
            return View();
        }

        [HttpGet("Login/GetLogout")]
        public ActionResult GetLogout()
        {
            ModelState.Clear();
            UserService.Token = new LoginToken();
            UserService.Token = null;
            return View();
        }

    }
}
