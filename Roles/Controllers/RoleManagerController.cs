using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Roles.Models;
using Roles.Models.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Roles.Controllers
{
    [Authorize(Roles = "SuperAdmin")]
    public class RoleManagerController : Controller
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        
        public RoleManagerController(RoleManager<IdentityRole> roleManager, UserManager<ApplicationUser> userManager)
        {
            _userManager = userManager;
            _roleManager = roleManager;
        }

        public async Task<IActionResult> Index()
        {
            var roles = await _roleManager.Roles.ToListAsync();
            return View(roles);
        }
        [HttpGet]
        public async Task<IActionResult> RemoveRoles(string id)
        {
            var role = await _roleManager.FindByNameAsync(id);
            return View(await _roleManager.DeleteAsync(role));
        }
        [HttpPost]
        public async Task<IActionResult> AddRole(string roleName)
        {
            if (roleName != null)
            {
                await _roleManager.CreateAsync(new IdentityRole(roleName.Trim()));
            }
            return RedirectToAction("Index");
        }


        public async Task<IActionResult> ListUserRoles()
        {
            var users = await _userManager.Users.ToListAsync();
            var userRolesViewModel = new List<UserRolesViewModel>();
            foreach (ApplicationUser user in users)
            {
                var thisViewModel = new UserRolesViewModel();
                thisViewModel.UserId = user.Id;
                thisViewModel.UserName = user.UserName;
                thisViewModel.FirstName = user.FirstName;
                thisViewModel.LastName = user.LastName;
                thisViewModel.Email = user.Email;
                thisViewModel.Roles = await getuserRoles(user);
                
                userRolesViewModel.Add(thisViewModel);
            }
            return View(userRolesViewModel);
        }

        private async Task<IEnumerable<string>> getuserRoles(ApplicationUser user)
        {
            return new List<string>(await _userManager.GetRolesAsync(user));
        }
    }
}
