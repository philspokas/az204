using System.Net;
using System.IO;
using System.Threading.Tasks;
using System.Text.Json;
using System.Text.Json.Serialization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Microsoft.Azure.Functions.Worker;
using Microsoft.Azure.Functions.Worker.Http;
using ewu.Function;

namespace ewu.Function
{
    public class Message 
    {
        public string? Name { get; set; }
        public string? Message { get; set; }
    }

    public class HttpTrigger1
    {
        private readonly ILogger _logger;

        public HttpTrigger1(ILoggerFactory loggerFactory)
        {
            _logger = loggerFactory.CreateLogger<HttpTrigger1>();
        }

        [Function("HttpTrigger1")]
        public static async Task<IActionResult> Run(
            [HttpTrigger(AuthorizationLevel.Anonymous, "get", "post")] HttpRequestData req
        )
        {
            _logger.LogInformation("HttpTrigger1 processed a request.");

            // query paramter
            string name = req.Query["name"];

            // request body
            string requestBody = await new StreamReader(req.Body).ReadToEndAsync();
            Message data = JsonSerializer.Deserialize<Message>(requestBody);
            name = name ?? data.Name;

            var response = req.CreateResponse(HttpStatusCode.OK);
            response.Headers.Add("Content-Type", "text/plain; charset=utf-8");

            string responseMessage = string.IsNullOrEmpty(name)
                ? "Welcome to Azure Functions"
                : $"Hello, {name}";
            response.WriteString(responseMessage);

            return response;
        }
    }
}
