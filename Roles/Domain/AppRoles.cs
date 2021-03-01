using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Roles.Domain
{
    public class AppRoles : IRole<Guid>
    {
        public Guid Id
        {
            get
            {
                return RoleId;
            }
        }
        public Guid RoleId { get; set; }
        public string Name { get; set; }

        public AppRoles()
        {

        }
        public string NormalizedName { get; set; }

    }
}
