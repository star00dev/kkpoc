using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using WebService.DataModel;

namespace WebService.Controllers
{
    [Route("api/messages")]
    public class MessagesController : ApiController
    {
        private readonly MessageEntities _entities = new MessageEntities();

        // GET: api/Messages
        public IHttpActionResult GetMessages()
        {
            return Ok(_entities.Messages.ToList());
        }

        // GET: api/Messages/5
        public async Task<IHttpActionResult> GetMessage(Guid id)
        {
            Message message = await _entities.Messages.FindAsync(id);
            if (message == null)
            {
                return NotFound();
            }

            return Ok(message);
        }

        
        // POST: api/Messages
        public async Task<IHttpActionResult> PostMessage(Message message)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            _entities.Messages.Add(message);

            try
            {
                await _entities.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (MessageExists(message.MessagesId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = message.MessagesId }, message);
        }
        
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                _entities.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool MessageExists(Guid id)
        {
            return _entities.Messages.Count(e => e.MessagesId == id) > 0;
        }
    }
}