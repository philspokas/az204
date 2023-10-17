using Azure.Core;
using Azure.Storage;
using Azure.Storage.Queues;
using Azure.Storage.Queues.Models;

var currentDate = DateTime.Now;
Console.WriteLine($"{Environment.NewLine}Testing Queue Storage on {currentDate:d} at {currentDate:t}!");

// string connectionString = ConfigurationManager.AppSettings["StorageConnectionString"];

string connectionString = "DefaultEndpointsProtocol=https;AccountName=test249861024;AccountKey=itHw8wF5DT3S5E6N8bM1x6yRycsf79LOWcKAX4KrhlvavKwzPaGH4R3kZCcXNZQKE7YjvMt5+BCh+AStux3Lww==;EndpointSuffix=core.windows.net";
string queueName = "test-queue";

QueueClient queueClient = new QueueClient(connectionString, queueName);
queueClient.CreateIfNotExists();

string message = "a message for the queue";
if (queueClient.Exists())
{
    // Send a message to the queue
    queueClient.SendMessage(message);

    // Retrieve the cached approximate message count.
    QueueProperties properties = queueClient.GetProperties();
    int cachedMessagesCount = properties.ApproximateMessagesCount;
    Console.WriteLine($"Number of messages in queue: {cachedMessagesCount}");

    // peek at it
    // Azure.Storage.Queues.Models.PeekedMessage[] messages = queueClient.PeekMessages();

}
else {
    Console.WriteLine($"{queueName} does not exist ");
}

// Console.Write($"{Environment.NewLine}Press any key to exit...");
// Console.ReadKey(true);

