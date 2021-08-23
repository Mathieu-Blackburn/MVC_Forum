using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using TP2_Mathieu_Blackburn_Rogers.Models;

namespace TP2_Mathieu_Blackburn_Rogers.Controllers
{
    public class UsersController : Controller
    {
        private readonly TP_W24Context _context;

        public UsersController(TP_W24Context context)
        {
            _context = context;
        }

        // GET: Users
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Index()
        {
            var query = (from u in _context.AspNetUsers
                         select new UserDisp
                         {
                             Id = u.Id,
                             Username = u.UserName,
                             Email = u.Email,
                             NbrQuestions = _context.Questions.Where(q => q.FkUser == u.Id).Count(),
                             NbrReponses = _context.Reponses.Where(r => r.FkUser == u.Id).Count(),
                             LastActivity = new DateTime?[]{_context.Questions
                                                            .Where(q => q.FkUser == u.Id)
                                                            .OrderByDescending(q => q.QueDate)
                                                            .FirstOrDefault().QueDate,
                                                            _context.Reponses
                                                            .Where(q => q.FkUser == u.Id)
                                                            .OrderByDescending(q => q.RepDate)
                                                            .FirstOrDefault().RepDate
                                                                                                }.Max()
                         });
            
            return View(await query.ToListAsync());
        }

        //// GET: Users/Details/5
        //public async Task<IActionResult> Details(string id)
        //{
        //    if (id == null)
        //    {
        //        return NotFound();
        //    }

        //    var aspNetUser = await _context.AspNetUsers
        //        .FirstOrDefaultAsync(m => m.Id == id);
        //    if (aspNetUser == null)
        //    {
        //        return NotFound();
        //    }

        //    return View(aspNetUser);
        //}

        //// GET: Users/Create
        //public IActionResult Create()
        //{
        //    return View();
        //}

        //// POST: Users/Create
        //// To protect from overposting attacks, enable the specific properties you want to bind to.
        //// For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public async Task<IActionResult> Create([Bind("Id,UserName,NormalizedUserName,Email,NormalizedEmail,EmailConfirmed,PasswordHash,SecurityStamp,ConcurrencyStamp,PhoneNumber,PhoneNumberConfirmed,TwoFactorEnabled,LockoutEnd,LockoutEnabled,AccessFailedCount")] AspNetUser aspNetUser)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        _context.Add(aspNetUser);
        //        await _context.SaveChangesAsync();
        //        return RedirectToAction(nameof(Index));
        //    }
        //    return View(aspNetUser);
        //}

        //// GET: Users/Edit/5
        //public async Task<IActionResult> Edit(string id)
        //{
        //    if (id == null)
        //    {
        //        return NotFound();
        //    }

        //    var aspNetUser = await _context.AspNetUsers.FindAsync(id);
        //    if (aspNetUser == null)
        //    {
        //        return NotFound();
        //    }
        //    return View(aspNetUser);
        //}

        //// POST: Users/Edit/5
        //// To protect from overposting attacks, enable the specific properties you want to bind to.
        //// For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public async Task<IActionResult> Edit(string id, [Bind("Id,UserName,NormalizedUserName,Email,NormalizedEmail,EmailConfirmed,PasswordHash,SecurityStamp,ConcurrencyStamp,PhoneNumber,PhoneNumberConfirmed,TwoFactorEnabled,LockoutEnd,LockoutEnabled,AccessFailedCount")] AspNetUser aspNetUser)
        //{
        //    if (id != aspNetUser.Id)
        //    {
        //        return NotFound();
        //    }

        //    if (ModelState.IsValid)
        //    {
        //        try
        //        {
        //            _context.Update(aspNetUser);
        //            await _context.SaveChangesAsync();
        //        }
        //        catch (DbUpdateConcurrencyException)
        //        {
        //            if (!AspNetUserExists(aspNetUser.Id))
        //            {
        //                return NotFound();
        //            }
        //            else
        //            {
        //                throw;
        //            }
        //        }
        //        return RedirectToAction(nameof(Index));
        //    }
        //    return View(aspNetUser);
        //}

        //// GET: Users/Delete/5
        //public async Task<IActionResult> Delete(string id)
        //{
        //    if (id == null)
        //    {
        //        return NotFound();
        //    }

        //    var aspNetUser = await _context.AspNetUsers
        //        .FirstOrDefaultAsync(m => m.Id == id);
        //    if (aspNetUser == null)
        //    {
        //        return NotFound();
        //    }

        //    return View(aspNetUser);
        //}

        //// POST: Users/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public async Task<IActionResult> DeleteConfirmed(string id)
        //{
        //    var aspNetUser = await _context.AspNetUsers.FindAsync(id);
        //    _context.AspNetUsers.Remove(aspNetUser);
        //    await _context.SaveChangesAsync();
        //    return RedirectToAction(nameof(Index));
        //}

        //private bool AspNetUserExists(string id)
        //{
        //    return _context.AspNetUsers.Any(e => e.Id == id);
        //}
    }

    public class UserDisp
    {
        [Key, Column(Order = 0)]
        public string Id { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public int NbrQuestions { get; set; }
        public int NbrReponses { get; set; }
        public DateTime? LastActivity { get; set; }
    }
}
