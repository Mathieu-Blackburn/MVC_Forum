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
    public class QuestionsController : Controller
    {
        private readonly TP_W24Context _context;

        public QuestionsController(TP_W24Context context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index(int? id)
        {
            if (id == 0 || id is null)
            {
                return RedirectToAction("Index", "Home");
            }

            var query = (from q in _context.Questions
                         where q.FkCatId == id
                         select new QueDisp
                         {
                             ID = q.QueId,
                             Titre = q.QueTitre,
                             Texte = q.QueTexte,
                             Date = q.QueDate.ToString(),
                             Views = q.QueViews,
                             Reps = _context.Reponses.Where(r => r.FkQueId == q.QueId).Where(t => t.RepActive == true).Count(),
                             CatID = q.FkCatId,
                             Active = q.QueActive,
                             User = q.FkUser,
                             Username = _context.AspNetUsers.Where(u => u.Id == q.FkUser).FirstOrDefault().UserName,
                             LastUser = _context.AspNetUsers.Where(u => u.Id == _context.Reponses
                                                 .Where(r => r.FkQueId == q.QueId)
                                                 .OrderByDescending(r => r.RepDate)
                                                 .FirstOrDefault().FkUser).FirstOrDefault().UserName,
                             LastAnswerDate = _context.Reponses
                                             .Where(r => r.FkQueId == q.QueId)
                                             .Where(t => t.RepActive == true)
                                             .OrderByDescending(r => r.RepDate)
                                             .FirstOrDefault().RepDate.ToString()
                         });
            ViewData["CatId"] = id;
            ViewData["CatName"] = _context.Categories.Where(c => c.CatId == id).SingleOrDefault().CatNom;

            return View(await query.ToListAsync());
        }

        // GET: Questions/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var question = await _context.Questions
                .Include(q => q.FkCat)
                .FirstOrDefaultAsync(m => m.QueId == id);
            if (question == null)
            {
                return NotFound();
            }
            ViewData["Username"] = _context.AspNetUsers.Where(u => u.Id == question.FkUser).FirstOrDefault().UserName;

            return View(question);
        }

        // GET: Questions/Create
        [Authorize]
        public IActionResult Create(int? id)
        {
            if(id == 0 || id is null)
            {
                return RedirectToAction("Index", "Home");
            }
            ViewData["FkCatId"] = id;
            ViewData["UserId"] = _context.AspNetUsers
                                    .Where(u => u.NormalizedUserName == User.Identity.Name.ToUpper())
                                    .FirstOrDefault().Id;
            return View();
        }

        // POST: Questions/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [Authorize]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("QueId,FkCatId,FkUser,QueTitre,QueTexte,QueDate,QueViews,QueActive")] Question question)
        {
            if (ModelState.IsValid)
            {
                _context.Add(question);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index), new { id = question.FkCatId });
            }
            ViewData["FkCatId"] = new SelectList(_context.Categories, "CatId", "CatDescription", question.FkCatId);
            return View(question);
        }

        // GET: Questions/Edit/5
        [Authorize]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var question = await _context.Questions.FindAsync(id);
            if (question == null)
            {
                return NotFound();
            }

            if(User.FindFirstValue(ClaimTypes.NameIdentifier) == question.FkUser)
            {
                ViewData["FkCatId"] = new SelectList(_context.Categories, "CatId", "CatDescription", question.FkCatId);
                return View(question);
            }
            else
            {
                return Forbid();
            }
            
        }

        // POST: Questions/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [Authorize]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("QueId,FkCatId,FkUser,QueTitre,QueTexte,QueDate,QueViews,QueActive")] Question question)
        {
            if (id != question.QueId)
            {
                return NotFound();
            }
            if (User.FindFirstValue(ClaimTypes.NameIdentifier) != question.FkUser)
            {
                return Forbid();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(question);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!QuestionExists(question.QueId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                //return RedirectToAction(nameof(Index));
                return RedirectToAction("Index", "Questions", new { id = question.FkCatId });
            }
            ViewData["FkCatId"] = new SelectList(_context.Categories, "CatId", "CatDescription", question.FkCatId);
            return View(question);
        }

        // GET: Questions/Delete/5
        [Authorize]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var question = await _context.Questions
                .Include(q => q.FkCat)
                .FirstOrDefaultAsync(m => m.QueId == id);
            if (question == null)
            {
                return NotFound();
            }
            if (User.FindFirstValue(ClaimTypes.NameIdentifier) != question.FkUser)
            {
                question.FkUser = _context.AspNetUsers.Where(u => u.Id == question.FkUser).FirstOrDefault().UserName;
                return View(question);
            }
            else
            {
                return Forbid();
            }
                
        }

        // POST: Questions/Delete/5
        [HttpPost, ActionName("Delete")]
        [Authorize]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var question = await _context.Questions.FindAsync(id);
            if (User.FindFirstValue(ClaimTypes.NameIdentifier) != question.FkUser)
            {
                question.QueActive = false;
                _context.Questions.Update(question);
                await _context.SaveChangesAsync();
                return RedirectToAction("Index", "Questions", new { id = question.FkCatId });
            }
            else
            {
                return Forbid();
            }
        }

        private bool QuestionExists(int id)
        {
            return _context.Questions.Any(e => e.QueId == id);
        }
    }

    public class QueDisp
    {
        [Key, Column(Order = 0)]
        public int ID { get; set; }
        public string Titre { get; set; }
        public string Texte { get; set; }
        public string Date { get; set; }
        public int? Views { get; set; }
        public int Reps { get; set; }
        public int CatID { get; internal set; }
        public bool Active { get; set; }
        public string User { get; set; }
        public string LastUser { get; set; }
        public string LastAnswerDate { get; set; }
        public string Username { get; set; }
    }
}
