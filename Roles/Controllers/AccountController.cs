using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Roles.Controllers
{
    public class AccountController : Controller
    {
        //private RoleManager<IdentityRole> roleManager;
        //private IdentityUserManager _userManager;
        public IActionResult Index()
        {
            return View();
        }




    }
}
