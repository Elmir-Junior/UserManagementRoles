using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.DependencyInjection;
using Roles.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Roles.Data
{
    public static class ContextSeed
    {
        public static async Task SeedRoleAsync(IServiceProvider serviceProvider)
        {
            //Seed Roles

            var roleManager = serviceProvider.GetRequiredService<RoleManager<IdentityRole>>();
            var userManager = serviceProvider.GetRequiredService<UserManager<ApplicationUser>>();
            await SeedRoleAsync(userManager, roleManager);
            await SeedSuperAdminAsync(userManager, roleManager);
        }

        public static async Task SeedRoleAsync(UserManager<ApplicationUser> userManager, RoleManager<IdentityRole> roleManager)
        {
            await roleManager.CreateAsync(new IdentityRole(enums.Roles.SuperAdmin.ToString()));
            await roleManager.CreateAsync(new IdentityRole(enums.Roles.Admin.ToString()));
            await roleManager.CreateAsync(new IdentityRole(enums.Roles.Moderator.ToString()));
            await roleManager.CreateAsync(new IdentityRole(enums.Roles.Basic.ToString()));
        }

        public static async Task SeedSuperAdminAsync(UserManager<ApplicationUser> userManager, RoleManager<IdentityRole> roleManager)
        {
            var user = new ApplicationUser()
            {
                UserName = "elmir",
                FirstName = "Elmir",
                LastName = "Junior",
                Email = "superelmir@gmail.com",
                EmailConfirmed = true,
                PhoneNumberConfirmed = true,

            };
            await userManager.CreateAsync(user, "elmir123");
            await userManager.AddToRoleAsync(user, enums.Roles.SuperAdmin.ToString());
            await userManager.AddToRoleAsync(user, enums.Roles.Moderator.ToString());
            await userManager.AddToRoleAsync(user, enums.Roles.Admin.ToString());
            await userManager.AddToRoleAsync(user, enums.Roles.Basic.ToString());
        }


    }
}
