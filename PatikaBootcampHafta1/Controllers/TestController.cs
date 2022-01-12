using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

using PatikaBootcampHafta1.Models;

namespace PatikaBootcampHafta1.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TestController : ControllerBase
    {
        // GET: method captures data if it is unvariable
        [HttpGet]
        //This method transfers all data to the client
        public string Get()
        {
            //An object of the TestModel is created to use it here
            TestModel create = new TestModel();
            List<TestModel> datas = create.CreateTestModel();

            //Generating string of the result to be returned to the client
            string temp = "List: \n";
            foreach(var data in datas)
            {
                temp = temp + "{" + data.Id + "}" + data.Name;
                if(data.Id < datas.Count-1)
                {
                    temp = temp + "\n ";
                }
            }
            //Result information return to client
            return temp;
        }

        // GET: method to catch the prompt if it contains the id variable
        [HttpGet("{id}")]
        //This method transfers the data on the matching Id to the client
        public string Get(int id)
        {
            //An object of the TestModel is created to use it here
            TestModel create = new TestModel();
            List<TestModel> datas = create.CreateTestModel();

            //Generating string of the result to be returned to the client
            string temp = datas.Find(x => x.Id == id).Name;

            //Result information return to client
            return temp;
        }

        // POST method to catch the prompt if it contains the id variable
        [HttpPost("{name}")]
        //This method makes a new addition to the list
        public string Post(string name)
        {
            //An object of the TestModel is created to use it here
            TestModel create = new TestModel();
            List<TestModel> datas = create.CreateTestModel();

            //Adding to list
            datas.Add(new TestModel { Id = datas.Count, Name = name });

            //Generating string of the result to be returned to the client
            string temp = "Id{" + datas.Find(x => x.Id == (datas.Count) - 1).Id + "} Name{" + datas.Find(x => x.Id == (datas.Count)-1).Name + "}";

            //Result information return to client
            return "Added: " + temp;
        }

        // PUT method to catch the prompt if it contains the id variable
        [HttpPut("{id}")]
        //This method replaces the matching Id data in the list
        public string Put(int? id, string name)
        {
            //An object of the TestModel is created to use it here
            TestModel create = new TestModel();
            List<TestModel> datas = create.CreateTestModel();


            //Generating string of the result to be returned to the client
            string temp = "Id{" + datas.Find(x => x.Id == id).Id + "} " +
                "Name{" + datas.Find(x => x.Id == id).Name + "} => ";

            //Changing item
            datas.Find(x => x.Id == id).Name = name;

            //Generating string of the result to be returned to the client
            temp = temp + " New Name{" + datas.Find(x => x.Id == id).Name + "}";

            //Result information return to client
            return "Changed: " + temp;
        }

        // DELETE method to catch the prompt if it contains the id variable
        [HttpDelete("{id}")]
        public string Delete(int id)//This method deletes data with matching Id
        {
            //An object of the TestModel is created to use it here
            TestModel create = new TestModel();
            List<TestModel> datas = create.CreateTestModel();

            //Generating string of the result to be returned to the client
            string temp = datas.Find(x => x.Id == id).Name;

            //Deleting operation
            datas.RemoveAll(x => x.Id == id);

            //Result information return to client
            return "Delete: " + temp + " New Item Count: " + datas.Count;
        }

    }
}
