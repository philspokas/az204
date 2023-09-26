using System.Environment;
using Microsoft.Azure.Cosmos;

// C# record r`epresenting an item in the container
public record Product(
    string id,
    string categoryId,
    string categoryName,
    string name,
    int quantity,
    bool sale
);


// New instance of CosmosClient class
using CosmosClient client = new(
    accountEndpoint: Environment.GetEnvironmentVariable("COSMOS_ENDPOINT")!,
    authKeyOrResourceToken: Environment.GetEnvironmentVariable("COSMOS_KEY")!
);

// Database reference with creation if it does not already exist
Database database = await client.CreateDatabaseIfNotExistsAsync(id: "cosmicworks");

Console.WriteLine($"New database:\t{database.Id}");

// Container reference with creation if it does not already exist
Container container = await database.CreateContainerIfNotExistsAsync(
    id: "products",
    partitionKeyPath: "/categoryId",
    throughput: 400
);

Console.WriteLine($"New container:\t{container.Id}");


// Create new object and upsert (create or replace) to container
Product newItem = new(
    id: "70b63682-b93a-4c77-aad2-65501347265f",
    categoryId: "61dba35b-4f02-45c5-b648-c6badc0cbd79",
    categoryName: "gear-surf-surfboards",
    name: "Yamba Surfboard",
    quantity: 12,
    sale: false
);

Product createdItem = await container.CreateItemAsync<Product>(
    item: newItem,
    partitionKey: new PartitionKey("61dba35b-4f02-45c5-b648-c6badc0cbd79")
);

Console.WriteLine($"Created item:\t{createdItem.id}\t[{createdItem.categoryName}]");