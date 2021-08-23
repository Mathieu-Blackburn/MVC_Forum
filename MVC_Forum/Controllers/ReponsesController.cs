using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using TP2_Mathieu_Blackburn_Rogers.Models;

namespace TP2_Mathieu_Blackburn_Rogers.Controllers
{
    public class ReponsesController : Controller
    {
        private readonly TP_W24Context _context;

        public ReponsesController(TP_W24Context context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index(int? id, int? pageNumber)
        {

            if (id == 0 || id is null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                var question = await _context.Questions.FindAsync(id);
                question.QueViews += 1;

                _context.Update(question);
                _context.SaveChanges();

                var query = (from r in _context.Reponses
                             where r.FkQueId == id
                             select new RepDisp
                             {
                                 ID = r.RepId,
                                 User = r.FkUser,
                                 Username = _context.AspNetUsers.Where(u => u.Id == r.FkUser).FirstOrDefault().UserName,
                                 Texte = r.RepTexte,
                                 Date = r.RepDate,
                                 Active = r.RepActive,
                                 QueID = r.FkQueId
                             });

                ViewData["Dict"] = new Dictionary<string, string>
                {
                    { "QuestionID", id.ToString() },
                    { "CategoryID", _context.Questions.Where(q => q.QueId == id).FirstOrDefault().FkCatId.ToString() },
                    { "QuestionTitre", question.QueTitre },
                    { "QuestionTexte", question.QueTexte }
                };
                var pageSize = 10;
                var currentPage = pageNumber ?? 1;

                return View(await PaginatedList<RepDisp>.CreateAsync(query, currentPage, pageSize));
                //return View(await query.ToListAsync());
            }
            
        }

        // GET: Reponses/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var reponse = await _context.Reponses
                .Include(r => r.FkQue)
                .FirstOrDefaultAsync(m => m.RepId == id);
            if (reponse == null)
            {
                return NotFound();
            }

            reponse.FkUser = _context.AspNetUsers.Where(u => u.Id == reponse.FkUser).FirstOrDefault().UserName;
            return View(reponse);
        }

        // GET: Reponses/Create
        [Authorize]
        public IActionResult Create(int? id)
        {
            ViewData["FkQueId"] = id;
            ViewData["UserId"] = _context.AspNetUsers
                                    .Where(u => u.NormalizedUserName == User.Identity.Name.ToUpper())
                                    .FirstOrDefault().Id;
            return View();
        }

        // POST: Reponses/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("RepId,FkQueId,FkUser,RepTexte,RepDate,RepActive")] Reponse reponse)
        {
            if (ModelState.IsValid)
            {
                _context.Add(reponse);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index), new { id = reponse.FkQueId });
            }
            ViewData["FkQueId"] = new SelectList(_context.Questions, "QueId", "QueTexte", reponse.FkQueId);
            return View(reponse);
        }

        // GET: Reponses/Edit/5
        [Authorize]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var reponse = await _context.Reponses.FindAsync(id);
            if (reponse == null)
            {
                return NotFound();
            }
            if (User.FindFirstValue(ClaimTypes.NameIdentifier) == reponse.FkUser)
            {
                ViewData["FkQueId"] = new SelectList(_context.Questions, "QueId", "QueTexte", reponse.FkQueId);
                return View(reponse);
            }
            else
            {
                return Forbid();
            }
        }

        // POST: Reponses/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [Authorize]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("RepId,FkQueId,FkUser,RepTexte,RepDate,RepActive")] Reponse reponse)
        {
            if (id != reponse.RepId)
            {
                return NotFound();
            }
            if (User.FindFirstValue(ClaimTypes.NameIdentifier) != reponse.FkUser)
            {
                return Forbid();
            }
                if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(reponse);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ReponseExists(reponse.RepId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index), new { id = reponse.FkQueId });
            }
            ViewData["FkQueId"] = new SelectList(_context.Questions, "QueId", "QueTexte", reponse.FkQueId);
            return View(reponse);
        }

        // GET: Reponses/Delete/5
        [Authorize]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            var reponse = await _context.Reponses
                .Include(r => r.FkQue)
                .FirstOrDefaultAsync(m => m.RepId == id);
            if (reponse == null)
            {
                return NotFound();
            }
            if (User.FindFirstValue(ClaimTypes.NameIdentifier) == reponse.FkUser)
            {
                return View(reponse);
            }
            else
            {
                return Forbid();
            }
                
        }

        // POST: Reponses/Delete/5
        [HttpPost, ActionName("Delete")]
        [Authorize]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var reponse = await _context.Reponses.FindAsync(id);
            if (User.FindFirstValue(ClaimTypes.NameIdentifier) == reponse.FkUser)
            {
                reponse.RepActive = false;
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index), new { id = reponse.FkQueId });
            }
            else
            {
                return Forbid();
            }
        }

        private bool ReponseExists(int id)
        {
            return _context.Reponses.Any(e => e.RepId == id);
        }
    }

    public class RepDisp
    {
        [Key, Column(Order = 0)]
        public int ID { get; internal set; }
        public string User { get; set; }
        public string Texte { get; set; }
        public DateTime Date { get; set; }
        public string QueTitre { get; internal set; }
        public string QueTexte { get; internal set; }
        public bool Active { get; internal set; }
        public int QueID { get; set; }
        public string Username { get; set; }
    }
}
