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
        public static async Task SeedSuperAdminAsync(UserManager<ApplicationUser> userManager, RoleManager<IdentityRole> roleManager)
        {
            var defaultUser = new ApplicationUser {
                UserName = "superelmir",
                Email = "superelmir@gmail.com",
                FirstName = "Elmiros",
                LastName = "Junioros",
                EmailConfirmed = true,
                PhoneNumberConfirmed = true
            };
            if (userManager.Users.All(u => u.Id != defaultUser.Id))
            {
                var user = await userManager.FindByEmailAsync(defaultUser.Email);
                if (user == null)
                {
                    await userManager.CreateAsync(defaultUser, "123Pa$$word.");
                    await userManager.AddToRoleAsync(defaultUser, enums.Roles.Basic.ToString());
                    await userManager.AddToRoleAsync(defaultUser, enums.Roles.Moderator.ToString());
                    await userManager.AddToRoleAsync(defaultUser, enums.Roles.Admin.ToString());
                    await userManager.AddToRoleAsync(defaultUser, enums.Roles.SuperAdmin.ToString());
                }
            }
        }

        
    }
}
