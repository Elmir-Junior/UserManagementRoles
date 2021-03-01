using Microsoft.AspNet.Identity;
using Roles.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Roles.Domain
{
    public class ManagerRoles : RoleManager<AppRoles, Guid>
    {
        public ManagerRoles(IRoleStore<AppRoles, Guid> roleStore)
            : base(roleStore)
        {
        }

        public static ManagerRoles Create(IdentityFactoryOptions<ManagerRoles> options, IOwinContext context)
        {
            return new ManagerRoles(new RoleStore<AppRoles>(context.Get<ApplicationDbContext>()));
        }

    }
}
