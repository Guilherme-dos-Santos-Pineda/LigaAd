using Microsoft.AspNetCore.Mvc;

namespace SoftHouse.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class DeveloperController : ControllerBase
    {

        private readonly ILogger<ChatController> _logger;

        public DeveloperController(ILogger<ChatController> logger)
        {
            _logger = logger;
        }

        [HttpPost]
        public <>()
        {

        }

    }
}
