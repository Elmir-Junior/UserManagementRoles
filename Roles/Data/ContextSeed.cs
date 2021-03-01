using Microsoft.AspNetCore.Identity;
using Roles.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Roles.Data
{
    public static class ContextSeed
    {
        public static async Task SeedRoleAsync(UserManager<ApplicationUser> usermanager, RoleManager<IdentityRole> roleManager)
        {
            //Seed Roles
            await roleManager.CreateAsync(new IdentityRole(enums.Roles.SuperAdmin.ToString()));
            await roleManager.CreateAsync(new IdentityRole(enums.Roles.Admin.ToString()));
            await roleManager.CreateAsync(new IdentityRole(enums.Roles.Moderator.ToString()));
            await roleManager.CreateAsync(new IdentityRole(enums.Roles.Basic.ToString()));
        }
    }
}
