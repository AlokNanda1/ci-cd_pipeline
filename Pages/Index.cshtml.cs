using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace CSM_Dummy.Pages
{
    public class IndexModel : PageModel
    {
        private readonly AppDbContext _context;

        public IndexModel(AppDbContext context)
        {
            _context = context;
        }

        // Define the Users property
        public IList<User> Users { get; set; }

        // Fetch users on GET request
        public async Task OnGetAsync()
        {
            Users = await _context.Users.ToListAsync();
        }
    }
}
 